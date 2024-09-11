﻿using Android.App;
using Android.Content.PM;
using Android.OS;

namespace Medtronic;

[Activity(Theme = "@style/Maui.SplashTheme", MainLauncher = true, ConfigurationChanges = ConfigChanges.ScreenSize | ConfigChanges.Orientation | ConfigChanges.UiMode | ConfigChanges.ScreenLayout | ConfigChanges.SmallestScreenSize | ConfigChanges.Density)]
public class MainActivity : MauiAppCompatActivity
{
    protected override void OnCreate(Bundle savedInstanceState)
    {
        base.OnCreate(savedInstanceState);
    }

    public override void OnBackPressed()
    {
        // Minimiza la aplicación en lugar de cerrarla
        MoveTaskToBack(true);
    }
}

// using Android.App;
// using Android.Content.PM;
// using Android.OS;

// namespace Medtronic;

// [Activity(Theme = "@style/Maui.SplashTheme", MainLauncher = true, LaunchMode = LaunchMode.SingleTop, ConfigurationChanges = ConfigChanges.ScreenSize | ConfigChanges.Orientation | ConfigChanges.UiMode | ConfigChanges.ScreenLayout | ConfigChanges.SmallestScreenSize | ConfigChanges.Density)]
// public class MainActivity : MauiAppCompatActivity
// {
// }
