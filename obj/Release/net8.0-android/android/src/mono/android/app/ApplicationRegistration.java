package mono.android.app;

public class ApplicationRegistration {

	public static void registerApplications ()
	{
				// Application and Instrumentation ACWs must be registered first.
		mono.android.Runtime.register ("Microsoft.Maui.MauiApplication, Microsoft.Maui, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null", crc6488302ad6e9e4df1a.MauiApplication.class, crc6488302ad6e9e4df1a.MauiApplication.__md_methods);
		mono.android.Runtime.register ("Medtronic.MainApplication, Medtronic, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null", crc646d33fc26d019925b.MainApplication.class, crc646d33fc26d019925b.MainApplication.__md_methods);
		
	}
}
