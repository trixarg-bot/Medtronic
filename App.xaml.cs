
namespace Medtronic;

public partial class App : Application
{
	public App()
	{
		InitializeComponent();
		MainPage = new AppShell();
	}

	  protected override void OnStart()
        {
            // Código para manejar el inicio de la aplicación
            System.Diagnostics.Debug.WriteLine("App Started");
        }

        protected override void OnSleep()
        {
            // Código para manejar la suspensión de la aplicación
            System.Diagnostics.Debug.WriteLine("App Sleep");
        }

        protected override void OnResume()
        {
            // Código para manejar la reanudación de la aplicación
            System.Diagnostics.Debug.WriteLine("App Resumed");
        }
}
