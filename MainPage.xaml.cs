using Microsoft.Maui.Storage;
using System.Net.Sockets;
using System.Text;
using Android.Bluetooth;
using Material.Components.Maui;
using Java.Sql;



namespace Medtronic;

public partial class MainPage : ContentPage
{
	int count = 0;


	private string _internalBatchNumber;

	private string _internalPartNumber;

	private const string PRINTER_PREFERENCE_KEY = "SelectedPrinterName";

	private Dictionary<string, BluetoothDevice> bluetoothDevices;

	public MainPage()
	{
		InitializeComponent();
		bluetoothDevices = new Dictionary<string, BluetoothDevice>();
		LoadBluetoothDevices();
		BluetoothDevicesPicker.SelectedIndexChanged += OnBluetoothDevicePickerSelectedIndexChanged;
	}

	private void LoadBluetoothDevices()
	{

		bluetoothDevices.Clear();
		BluetoothDevicesPicker.Items.Clear();

		BluetoothAdapter bluetoothAdapter = BluetoothAdapter.DefaultAdapter;
		if (bluetoothAdapter != null && bluetoothAdapter.IsEnabled)
		{
			foreach (var device in bluetoothAdapter.BondedDevices)
			{
				string deviceInfo = $"{device.Name} ({device.Address})";
				bluetoothDevices[deviceInfo] = device;
				BluetoothDevicesPicker.Items.Add(deviceInfo);
			}

			// Cargar la selección guardada
			string savedPrinter = GetSavedPrinter();
			if (!string.IsNullOrEmpty(savedPrinter) && BluetoothDevicesPicker.Items.Contains(savedPrinter))
			{
				BluetoothDevicesPicker.SelectedItem = savedPrinter;
			}
		}
		else
		{
			DisplayAlert("Error", "Bluetooth no está disponible o no está habilitado.", "OK");
		}
	}



	private string GetSavedPrinterName()
	{
		return Preferences.Get(PRINTER_PREFERENCE_KEY, string.Empty);
	}

	private void SavePrinterName(string printerName)
	{
		Preferences.Set(PRINTER_PREFERENCE_KEY, printerName);
	}

	private async void OnPrintButtonClicked(object sender, EventArgs e)
	{

		if (string.IsNullOrWhiteSpace(PartNumberEntry.Text) || string.IsNullOrWhiteSpace(BatchNumberEntry.Text) || string.IsNullOrWhiteSpace(QuantityEntry.Text) || string.IsNullOrWhiteSpace(InitialsEntry.Text) || string.IsNullOrWhiteSpace(LabelsQuantityEntry.Text))
		{
			await DisplayAlert("ERROR ❌", "Tiene que llenar los campos para poder imprimir", "OK");
		}
		else
		{
			if (BluetoothDevicesPicker.SelectedIndex == -1)
			{
				await DisplayAlert("Error", "Por favor, seleccione un PRINTER", "OK");
				return;
			}

			string selectedDeviceInfo = BluetoothDevicesPicker.SelectedItem.ToString();
			BluetoothDevice selectedDevice = bluetoothDevices[selectedDeviceInfo];

			SavePrinterName(selectedDevice.Name);

			string printCode =

				"^XA \r" +
					 "^PW609 \r" +
					 "^FT 55,71^A0N,28,28^FH\\^FDPART ^FS \r" +
					 "^FT 55,105^A0N,28,28^FH\\^FDNUMBER^FS \r" +
					 "^FT 55,157^A0N,28,28^FH\\^FDBATCH^FS \r" +
					 "^FT 55,191^A0N,28,28^FH\\^FDNUMBER^FS \r" +
					 "^FT 55,253^A0N,27,26^FH\\^FDQUANTITY:^FS \r" +
					 "^FT 230,256^A0N,27,26^FH\\^FD" + QuantityEntry.Text.Trim() + "^FS \r" +
					 "^FT 55,294^A0N,27,26^FH\\^FDINITIALS:^FS \r" +
					 "^FT 229,297^A0N,27,26^FH\\^FD" + InitialsEntry.Text.Trim() + "^FS \r" +
					 "^FT 55,336^A0N,27,26^FH\\^FDDATE:^FS \r" +
					 "^FT 229,336^A0N,27,26^FH\\^FD" + DateTime.Now.ToString().Trim() + "^FS \r" +
					 "^BY 2,3,54^FT211,90^BCN,,Y,N \r" +
					 "^FD" + PartNumberEntry.Text.Trim() + "^FS \r" +
					 "^BY 2,3,33 \r" +
					 "^FT 220,162^BCN,,Y,N \r" +
					 "^FD" + BatchNumberEntry.Text.Trim() + "^FS \r" +
					 "^PQ" + LabelsQuantityEntry.Text.Trim() + " \r" +
					 "^XZ \r";



			await SendPrintToHoneywell(selectedDevice, printCode);

			PartNumberEntry.Text = string.Empty;
			BatchNumberEntry.Text = string.Empty;
			QuantityEntry.Text = string.Empty;
			LabelsQuantityEntry.Text = "1";
			PartNumberEntry.IsEnabled = true;
			BatchNumberEntry.IsEnabled = true;
			PartNumberEntry.Focus();
		}

	}


	private async Task SendPrintToHoneywell(BluetoothDevice device, string printCode)
	{
		try
		{
			if (device == null)
			{
				await DisplayAlert("Error", "No se ha seleccionado una impresora.", "OK");
				return;
			}

			using (BluetoothSocket socket = device.CreateRfcommSocketToServiceRecord(Java.Util.UUID.FromString("00001101-0000-1000-8000-00805F9B34FB")))
			{
				await socket.ConnectAsync();

				if (socket.IsConnected)
				{
					await using (Stream outStream = socket.OutputStream)
					{
						byte[] data = Encoding.ASCII.GetBytes(printCode);
						await outStream.WriteAsync(data, 0, data.Length);
						await Task.Delay(1000);
					}

					socket.Close();
				}
				else
				{
					await DisplayAlert("Error", "No se pudo establecer la conexión con la impresora.", "OK");
				}
			}
		}
		catch (Exception ex)
		{
			await DisplayAlert("Error", $"No se pudo imprimir: {ex.Message}", "OK");
		}
	}


	private void OnPartNumberEntryUnfocused(object sender, FocusEventArgs e)
	{
		HandlePartNumberEntryUnfocused((Entry)sender, ((Entry)sender).Text);
	}

	private void OnBatchNumberEntryUnFocused(object sender, FocusEventArgs e)
	{
		HandleBatchNumberEntryUnfocused((Entry)sender, ((Entry)sender).Text);
	}


	private void HandlePartNumberEntryUnfocused(Entry entry, string newText)
	{
		if (!string.IsNullOrEmpty(newText))
		{
			if (newText.StartsWith("*"))
			{
				// Guardamos el valor interno sin el "*"
				_internalPartNumber = newText.Substring(1);

				// Actualizamos el texto del Entry reemplazando "*" por el carácter invisible
				var newEntryText = _internalPartNumber;
				entry.Text = newEntryText;

				PartNumberEntry.IsEnabled = false;

			}
			else
			{
				// Si el texto no comienza con "*", lo borramos
				entry.Text = string.Empty;
				PartNumberEntry.Focus();
			}
		}
		else
		{
			_internalPartNumber = string.Empty;
		}
	}

	private void HandleBatchNumberEntryUnfocused(Entry entry, string newText)
	{
		if (!string.IsNullOrEmpty(newText))
		{
			if (newText.StartsWith("*"))
			{
				// Guardamos el valor interno sin el "*"
				_internalBatchNumber = newText.Substring(1);

				// Actualizamos el texto del Entry reemplazando "*" por el carácter invisible
				var newEntryText = _internalBatchNumber;
				entry.Text = newEntryText;

				if (entry.Text != PartNumberEntry.Text)
				{
					BatchNumberEntry.IsEnabled = false;
				}
				else
				{
					// Si el texto no comienza con "*", lo borramos
					entry.Text = string.Empty;
					BatchNumberEntry.Focus();
				}

			}
			else
			{
				// Si el texto no comienza con "*", lo borramos
				entry.Text = string.Empty;
				BatchNumberEntry.Focus();
			}
		}
		else
		{
			_internalBatchNumber = string.Empty;
		}
	}

	private async void OnClickedClearData(object sender, EventArgs e)
	{
		PartNumberEntry.Text = string.Empty;
		BatchNumberEntry.Text = string.Empty;
		QuantityEntry.Text = string.Empty;
		LabelsQuantityEntry.Text = "1";
		PartNumberEntry.IsEnabled = true;
		BatchNumberEntry.IsEnabled = true;
		PartNumberEntry.Focus();
	}


	private const string SELECTED_PRINTER_KEY = "SelectedPrinter";

	private void SaveSelectedPrinter(string selectedPrinter)
	{
		Preferences.Set(SELECTED_PRINTER_KEY, selectedPrinter);
	}

	private string GetSavedPrinter()
	{
		return Preferences.Get(SELECTED_PRINTER_KEY, string.Empty);
	}

	private void OnBluetoothDevicePickerSelectedIndexChanged(object sender, EventArgs e)
	{
		if (BluetoothDevicesPicker.SelectedItem != null)
		{
			string selectedDeviceInfo = BluetoothDevicesPicker.SelectedItem.ToString();
			SaveSelectedPrinter(selectedDeviceInfo);
			PartNumberEntry.Focus();
		}
	}
}
