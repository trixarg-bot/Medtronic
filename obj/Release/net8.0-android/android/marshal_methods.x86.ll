; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [122 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [244 x i32] [
	i32 42639949, ; 0: System.Threading.Thread => 0x28aa24d => 113
	i32 67008169, ; 1: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 33
	i32 72070932, ; 2: Microsoft.Maui.Graphics.dll => 0x44bb714 => 49
	i32 117431740, ; 3: System.Runtime.InteropServices => 0x6ffddbc => 108
	i32 165246403, ; 4: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 56
	i32 182336117, ; 5: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 74
	i32 195452805, ; 6: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 30
	i32 199333315, ; 7: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 31
	i32 205061960, ; 8: System.ComponentModel => 0xc38ff48 => 89
	i32 209399409, ; 9: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 54
	i32 230752869, ; 10: Microsoft.CSharp.dll => 0xdc10265 => 82
	i32 273568582, ; 11: Plugin.BLE => 0x104e5346 => 50
	i32 280992041, ; 12: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 2
	i32 317674968, ; 13: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 30
	i32 318968648, ; 14: Xamarin.AndroidX.Activity.dll => 0x13031348 => 51
	i32 321597661, ; 15: System.Numerics => 0x132b30dd => 104
	i32 336156722, ; 16: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 15
	i32 342366114, ; 17: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 63
	i32 356389973, ; 18: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 14
	i32 379916513, ; 19: System.Threading.Thread.dll => 0x16a510e1 => 113
	i32 385762202, ; 20: System.Memory.dll => 0x16fe439a => 99
	i32 395744057, ; 21: _Microsoft.Android.Resource.Designer => 0x17969339 => 34
	i32 435591531, ; 22: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 26
	i32 442521989, ; 23: Xamarin.Essentials => 0x1a605985 => 77
	i32 442565967, ; 24: System.Collections => 0x1a61054f => 86
	i32 450948140, ; 25: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 62
	i32 465846621, ; 26: mscorlib => 0x1bc4415d => 117
	i32 469710990, ; 27: System.dll => 0x1bff388e => 116
	i32 498788369, ; 28: System.ObjectModel => 0x1dbae811 => 105
	i32 500358224, ; 29: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 13
	i32 503918385, ; 30: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 7
	i32 513247710, ; 31: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 44
	i32 539058512, ; 32: Microsoft.Extensions.Logging => 0x20216150 => 41
	i32 592146354, ; 33: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 21
	i32 627609679, ; 34: Xamarin.AndroidX.CustomView => 0x2568904f => 60
	i32 627931235, ; 35: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 19
	i32 672442732, ; 36: System.Collections.Concurrent => 0x2814a96c => 83
	i32 688181140, ; 37: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 1
	i32 706645707, ; 38: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 16
	i32 709557578, ; 39: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 4
	i32 722857257, ; 40: System.Runtime.Loader.dll => 0x2b15ed29 => 109
	i32 759454413, ; 41: System.Net.Requests => 0x2d445acd => 102
	i32 775507847, ; 42: System.IO.Compression => 0x2e394f87 => 96
	i32 777317022, ; 43: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 25
	i32 789151979, ; 44: Microsoft.Extensions.Options => 0x2f0980eb => 43
	i32 823281589, ; 45: System.Private.Uri.dll => 0x311247b5 => 106
	i32 830298997, ; 46: System.IO.Compression.Brotli => 0x317d5b75 => 95
	i32 864477724, ; 47: Plugin.BLE.dll => 0x3386e21c => 50
	i32 904024072, ; 48: System.ComponentModel.Primitives.dll => 0x35e25008 => 87
	i32 926902833, ; 49: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 28
	i32 967690846, ; 50: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 63
	i32 992768348, ; 51: System.Collections.dll => 0x3b2c715c => 86
	i32 1012816738, ; 52: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 73
	i32 1019214401, ; 53: System.Drawing => 0x3cbffa41 => 94
	i32 1028951442, ; 54: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 40
	i32 1029334545, ; 55: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 3
	i32 1035644815, ; 56: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 52
	i32 1036536393, ; 57: System.Drawing.Primitives.dll => 0x3dc84a49 => 93
	i32 1044663988, ; 58: System.Linq.Expressions.dll => 0x3e444eb4 => 97
	i32 1052210849, ; 59: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 65
	i32 1082857460, ; 60: System.ComponentModel.TypeConverter => 0x408b17f4 => 88
	i32 1084122840, ; 61: Xamarin.Kotlin.StdLib => 0x409e66d8 => 79
	i32 1098259244, ; 62: System => 0x41761b2c => 116
	i32 1118262833, ; 63: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 16
	i32 1168523401, ; 64: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 22
	i32 1178241025, ; 65: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 70
	i32 1203215381, ; 66: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 20
	i32 1234928153, ; 67: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 18
	i32 1260983243, ; 68: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 2
	i32 1293217323, ; 69: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 61
	i32 1324164729, ; 70: System.Linq => 0x4eed2679 => 98
	i32 1373134921, ; 71: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 32
	i32 1376866003, ; 72: Xamarin.AndroidX.SavedState => 0x52114ed3 => 73
	i32 1406073936, ; 73: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 57
	i32 1430672901, ; 74: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 0
	i32 1461004990, ; 75: es\Microsoft.Maui.Controls.resources => 0x57152abe => 6
	i32 1462112819, ; 76: System.IO.Compression.dll => 0x57261233 => 96
	i32 1469204771, ; 77: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 53
	i32 1470490898, ; 78: Microsoft.Extensions.Primitives => 0x57a5e912 => 44
	i32 1480492111, ; 79: System.IO.Compression.Brotli.dll => 0x583e844f => 95
	i32 1493001747, ; 80: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 10
	i32 1514721132, ; 81: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 5
	i32 1543031311, ; 82: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 112
	i32 1551623176, ; 83: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 25
	i32 1616730037, ; 84: MaterialColorUtilities => 0x605d57b5 => 36
	i32 1622152042, ; 85: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 67
	i32 1624863272, ; 86: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 76
	i32 1636350590, ; 87: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 59
	i32 1639515021, ; 88: System.Net.Http.dll => 0x61b9038d => 100
	i32 1639986890, ; 89: System.Text.RegularExpressions => 0x61c036ca => 112
	i32 1657153582, ; 90: System.Runtime => 0x62c6282e => 110
	i32 1658251792, ; 91: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 78
	i32 1677501392, ; 92: System.Net.Primitives.dll => 0x63fca3d0 => 101
	i32 1679769178, ; 93: System.Security.Cryptography => 0x641f3e5a => 111
	i32 1729485958, ; 94: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 55
	i32 1736233607, ; 95: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 23
	i32 1743415430, ; 96: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 1
	i32 1766324549, ; 97: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 74
	i32 1770582343, ; 98: Microsoft.Extensions.Logging.dll => 0x6988f147 => 41
	i32 1776026572, ; 99: System.Core.dll => 0x69dc03cc => 91
	i32 1780572499, ; 100: Mono.Android.Runtime.dll => 0x6a216153 => 120
	i32 1782862114, ; 101: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 17
	i32 1788241197, ; 102: Xamarin.AndroidX.Fragment => 0x6a96652d => 62
	i32 1793755602, ; 103: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 9
	i32 1808609942, ; 104: Xamarin.AndroidX.Loader => 0x6bcd3296 => 67
	i32 1813058853, ; 105: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 79
	i32 1813201214, ; 106: Xamarin.Google.Android.Material => 0x6c13413e => 78
	i32 1818569960, ; 107: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 71
	i32 1828688058, ; 108: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 42
	i32 1842015223, ; 109: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 29
	i32 1853025655, ; 110: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 26
	i32 1858542181, ; 111: System.Linq.Expressions => 0x6ec71a65 => 97
	i32 1867746548, ; 112: Xamarin.Essentials.dll => 0x6f538cf4 => 77
	i32 1875935024, ; 113: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 8
	i32 1910275211, ; 114: System.Collections.NonGeneric.dll => 0x71dc7c8b => 84
	i32 1968388702, ; 115: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 37
	i32 2003115576, ; 116: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 5
	i32 2019465201, ; 117: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 65
	i32 2025202353, ; 118: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 0
	i32 2045470958, ; 119: System.Private.Xml => 0x79eb68ee => 107
	i32 2055257422, ; 120: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 64
	i32 2066184531, ; 121: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 4
	i32 2079903147, ; 122: System.Runtime.dll => 0x7bf8cdab => 110
	i32 2090596640, ; 123: System.Numerics.Vectors => 0x7c9bf920 => 103
	i32 2127167465, ; 124: System.Console => 0x7ec9ffe9 => 90
	i32 2142473426, ; 125: System.Collections.Specialized => 0x7fb38cd2 => 85
	i32 2159891885, ; 126: Microsoft.Maui => 0x80bd55ad => 47
	i32 2169148018, ; 127: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 12
	i32 2181898931, ; 128: Microsoft.Extensions.Options.dll => 0x820d22b3 => 43
	i32 2192057212, ; 129: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 42
	i32 2193016926, ; 130: System.ObjectModel.dll => 0x82b6c85e => 105
	i32 2201107256, ; 131: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 80
	i32 2201231467, ; 132: System.Net.Http => 0x8334206b => 100
	i32 2207618523, ; 133: it\Microsoft.Maui.Controls.resources => 0x839595db => 14
	i32 2266799131, ; 134: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 38
	i32 2270573516, ; 135: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 8
	i32 2279755925, ; 136: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 72
	i32 2303942373, ; 137: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 18
	i32 2305521784, ; 138: System.Private.CoreLib.dll => 0x896b7878 => 118
	i32 2353062107, ; 139: System.Net.Primitives => 0x8c40e0db => 101
	i32 2368005991, ; 140: System.Xml.ReaderWriter.dll => 0x8d24e767 => 115
	i32 2371007202, ; 141: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 37
	i32 2395872292, ; 142: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 13
	i32 2427813419, ; 143: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 10
	i32 2435356389, ; 144: System.Console.dll => 0x912896e5 => 90
	i32 2475788418, ; 145: Java.Interop.dll => 0x93918882 => 119
	i32 2480646305, ; 146: Microsoft.Maui.Controls => 0x93dba8a1 => 45
	i32 2550873716, ; 147: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 11
	i32 2562349572, ; 148: Microsoft.CSharp => 0x98ba5a04 => 82
	i32 2593496499, ; 149: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 20
	i32 2605712449, ; 150: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 80
	i32 2617129537, ; 151: System.Private.Xml.dll => 0x9bfe3a41 => 107
	i32 2620871830, ; 152: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 59
	i32 2626831493, ; 153: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 15
	i32 2663698177, ; 154: System.Runtime.Loader => 0x9ec4cf01 => 109
	i32 2665622720, ; 155: System.Drawing.Primitives => 0x9ee22cc0 => 93
	i32 2732626843, ; 156: Xamarin.AndroidX.Activity => 0xa2e0939b => 51
	i32 2737747696, ; 157: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 53
	i32 2752995522, ; 158: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 21
	i32 2758225723, ; 159: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 46
	i32 2764765095, ; 160: Microsoft.Maui.dll => 0xa4caf7a7 => 47
	i32 2778768386, ; 161: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 75
	i32 2785988530, ; 162: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 27
	i32 2801831435, ; 163: Microsoft.Maui.Graphics => 0xa7008e0b => 49
	i32 2806116107, ; 164: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 6
	i32 2810250172, ; 165: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 57
	i32 2831556043, ; 166: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 19
	i32 2853208004, ; 167: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 75
	i32 2861189240, ; 168: Microsoft.Maui.Essentials => 0xaa8a4878 => 48
	i32 2905242038, ; 169: mscorlib.dll => 0xad2a79b6 => 117
	i32 2909740682, ; 170: System.Private.CoreLib => 0xad6f1e8a => 118
	i32 2916838712, ; 171: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 76
	i32 2919462931, ; 172: System.Numerics.Vectors.dll => 0xae037813 => 103
	i32 2952168348, ; 173: Medtronic => 0xaff6839c => 81
	i32 2959614098, ; 174: System.ComponentModel.dll => 0xb0682092 => 89
	i32 2978675010, ; 175: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 61
	i32 3038032645, ; 176: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 34
	i32 3057625584, ; 177: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 68
	i32 3059408633, ; 178: Mono.Android.Runtime => 0xb65adef9 => 120
	i32 3059793426, ; 179: System.ComponentModel.Primitives => 0xb660be12 => 87
	i32 3077302341, ; 180: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 12
	i32 3178803400, ; 181: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 69
	i32 3220365878, ; 182: System.Threading => 0xbff2e236 => 114
	i32 3258312781, ; 183: Xamarin.AndroidX.CardView => 0xc235e84d => 55
	i32 3305363605, ; 184: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 7
	i32 3316684772, ; 185: System.Net.Requests.dll => 0xc5b097e4 => 102
	i32 3317135071, ; 186: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 60
	i32 3346324047, ; 187: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 70
	i32 3357674450, ; 188: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 24
	i32 3362522851, ; 189: Xamarin.AndroidX.Core => 0xc86c06e3 => 58
	i32 3366347497, ; 190: Java.Interop => 0xc8a662e9 => 119
	i32 3374999561, ; 191: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 72
	i32 3381016424, ; 192: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 3
	i32 3428513518, ; 193: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 39
	i32 3450328092, ; 194: Medtronic.dll => 0xcda7d41c => 81
	i32 3463511458, ; 195: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 11
	i32 3471940407, ; 196: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 88
	i32 3476120550, ; 197: Mono.Android => 0xcf3163e6 => 121
	i32 3479583265, ; 198: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 24
	i32 3484440000, ; 199: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 23
	i32 3580758918, ; 200: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 31
	i32 3602190383, ; 201: Material.Components.Maui => 0xd6b5102f => 35
	i32 3608519521, ; 202: System.Linq.dll => 0xd715a361 => 98
	i32 3641597786, ; 203: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 64
	i32 3643446276, ; 204: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 28
	i32 3643854240, ; 205: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 69
	i32 3657292374, ; 206: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 38
	i32 3672681054, ; 207: Mono.Android.dll => 0xdae8aa5e => 121
	i32 3682565725, ; 208: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 54
	i32 3697841164, ; 209: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 33
	i32 3724971120, ; 210: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 68
	i32 3748608112, ; 211: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 92
	i32 3786282454, ; 212: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 56
	i32 3792276235, ; 213: System.Collections.NonGeneric => 0xe2098b0b => 84
	i32 3802395368, ; 214: System.Collections.Specialized.dll => 0xe2a3f2e8 => 85
	i32 3823082795, ; 215: System.Security.Cryptography.dll => 0xe3df9d2b => 111
	i32 3829621856, ; 216: System.Numerics.dll => 0xe4436460 => 104
	i32 3841636137, ; 217: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 40
	i32 3849253459, ; 218: System.Runtime.InteropServices.dll => 0xe56ef253 => 108
	i32 3889960447, ; 219: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 32
	i32 3896106733, ; 220: System.Collections.Concurrent.dll => 0xe839deed => 83
	i32 3896760992, ; 221: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 58
	i32 3925138177, ; 222: Material.Components.Maui.dll => 0xe9f4db01 => 35
	i32 3928044579, ; 223: System.Xml.ReaderWriter => 0xea213423 => 115
	i32 3931092270, ; 224: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 71
	i32 3955647286, ; 225: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 52
	i32 3980434154, ; 226: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 27
	i32 3987592930, ; 227: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 9
	i32 4025784931, ; 228: System.Memory => 0xeff49a63 => 99
	i32 4046471985, ; 229: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 46
	i32 4073602200, ; 230: System.Threading.dll => 0xf2ce3c98 => 114
	i32 4094352644, ; 231: Microsoft.Maui.Essentials.dll => 0xf40add04 => 48
	i32 4099507663, ; 232: System.Drawing.dll => 0xf45985cf => 94
	i32 4100113165, ; 233: System.Private.Uri => 0xf462c30d => 106
	i32 4102112229, ; 234: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 22
	i32 4125707920, ; 235: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 17
	i32 4126470640, ; 236: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 39
	i32 4150914736, ; 237: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 29
	i32 4151237749, ; 238: System.Core => 0xf76edc75 => 91
	i32 4172222102, ; 239: MaterialColorUtilities.dll => 0xf8af0e96 => 36
	i32 4182413190, ; 240: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 66
	i32 4213026141, ; 241: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 92
	i32 4271975918, ; 242: Microsoft.Maui.Controls.dll => 0xfea12dee => 45
	i32 4292120959 ; 243: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 66
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [244 x i32] [
	i32 113, ; 0
	i32 33, ; 1
	i32 49, ; 2
	i32 108, ; 3
	i32 56, ; 4
	i32 74, ; 5
	i32 30, ; 6
	i32 31, ; 7
	i32 89, ; 8
	i32 54, ; 9
	i32 82, ; 10
	i32 50, ; 11
	i32 2, ; 12
	i32 30, ; 13
	i32 51, ; 14
	i32 104, ; 15
	i32 15, ; 16
	i32 63, ; 17
	i32 14, ; 18
	i32 113, ; 19
	i32 99, ; 20
	i32 34, ; 21
	i32 26, ; 22
	i32 77, ; 23
	i32 86, ; 24
	i32 62, ; 25
	i32 117, ; 26
	i32 116, ; 27
	i32 105, ; 28
	i32 13, ; 29
	i32 7, ; 30
	i32 44, ; 31
	i32 41, ; 32
	i32 21, ; 33
	i32 60, ; 34
	i32 19, ; 35
	i32 83, ; 36
	i32 1, ; 37
	i32 16, ; 38
	i32 4, ; 39
	i32 109, ; 40
	i32 102, ; 41
	i32 96, ; 42
	i32 25, ; 43
	i32 43, ; 44
	i32 106, ; 45
	i32 95, ; 46
	i32 50, ; 47
	i32 87, ; 48
	i32 28, ; 49
	i32 63, ; 50
	i32 86, ; 51
	i32 73, ; 52
	i32 94, ; 53
	i32 40, ; 54
	i32 3, ; 55
	i32 52, ; 56
	i32 93, ; 57
	i32 97, ; 58
	i32 65, ; 59
	i32 88, ; 60
	i32 79, ; 61
	i32 116, ; 62
	i32 16, ; 63
	i32 22, ; 64
	i32 70, ; 65
	i32 20, ; 66
	i32 18, ; 67
	i32 2, ; 68
	i32 61, ; 69
	i32 98, ; 70
	i32 32, ; 71
	i32 73, ; 72
	i32 57, ; 73
	i32 0, ; 74
	i32 6, ; 75
	i32 96, ; 76
	i32 53, ; 77
	i32 44, ; 78
	i32 95, ; 79
	i32 10, ; 80
	i32 5, ; 81
	i32 112, ; 82
	i32 25, ; 83
	i32 36, ; 84
	i32 67, ; 85
	i32 76, ; 86
	i32 59, ; 87
	i32 100, ; 88
	i32 112, ; 89
	i32 110, ; 90
	i32 78, ; 91
	i32 101, ; 92
	i32 111, ; 93
	i32 55, ; 94
	i32 23, ; 95
	i32 1, ; 96
	i32 74, ; 97
	i32 41, ; 98
	i32 91, ; 99
	i32 120, ; 100
	i32 17, ; 101
	i32 62, ; 102
	i32 9, ; 103
	i32 67, ; 104
	i32 79, ; 105
	i32 78, ; 106
	i32 71, ; 107
	i32 42, ; 108
	i32 29, ; 109
	i32 26, ; 110
	i32 97, ; 111
	i32 77, ; 112
	i32 8, ; 113
	i32 84, ; 114
	i32 37, ; 115
	i32 5, ; 116
	i32 65, ; 117
	i32 0, ; 118
	i32 107, ; 119
	i32 64, ; 120
	i32 4, ; 121
	i32 110, ; 122
	i32 103, ; 123
	i32 90, ; 124
	i32 85, ; 125
	i32 47, ; 126
	i32 12, ; 127
	i32 43, ; 128
	i32 42, ; 129
	i32 105, ; 130
	i32 80, ; 131
	i32 100, ; 132
	i32 14, ; 133
	i32 38, ; 134
	i32 8, ; 135
	i32 72, ; 136
	i32 18, ; 137
	i32 118, ; 138
	i32 101, ; 139
	i32 115, ; 140
	i32 37, ; 141
	i32 13, ; 142
	i32 10, ; 143
	i32 90, ; 144
	i32 119, ; 145
	i32 45, ; 146
	i32 11, ; 147
	i32 82, ; 148
	i32 20, ; 149
	i32 80, ; 150
	i32 107, ; 151
	i32 59, ; 152
	i32 15, ; 153
	i32 109, ; 154
	i32 93, ; 155
	i32 51, ; 156
	i32 53, ; 157
	i32 21, ; 158
	i32 46, ; 159
	i32 47, ; 160
	i32 75, ; 161
	i32 27, ; 162
	i32 49, ; 163
	i32 6, ; 164
	i32 57, ; 165
	i32 19, ; 166
	i32 75, ; 167
	i32 48, ; 168
	i32 117, ; 169
	i32 118, ; 170
	i32 76, ; 171
	i32 103, ; 172
	i32 81, ; 173
	i32 89, ; 174
	i32 61, ; 175
	i32 34, ; 176
	i32 68, ; 177
	i32 120, ; 178
	i32 87, ; 179
	i32 12, ; 180
	i32 69, ; 181
	i32 114, ; 182
	i32 55, ; 183
	i32 7, ; 184
	i32 102, ; 185
	i32 60, ; 186
	i32 70, ; 187
	i32 24, ; 188
	i32 58, ; 189
	i32 119, ; 190
	i32 72, ; 191
	i32 3, ; 192
	i32 39, ; 193
	i32 81, ; 194
	i32 11, ; 195
	i32 88, ; 196
	i32 121, ; 197
	i32 24, ; 198
	i32 23, ; 199
	i32 31, ; 200
	i32 35, ; 201
	i32 98, ; 202
	i32 64, ; 203
	i32 28, ; 204
	i32 69, ; 205
	i32 38, ; 206
	i32 121, ; 207
	i32 54, ; 208
	i32 33, ; 209
	i32 68, ; 210
	i32 92, ; 211
	i32 56, ; 212
	i32 84, ; 213
	i32 85, ; 214
	i32 111, ; 215
	i32 104, ; 216
	i32 40, ; 217
	i32 108, ; 218
	i32 32, ; 219
	i32 83, ; 220
	i32 58, ; 221
	i32 35, ; 222
	i32 115, ; 223
	i32 71, ; 224
	i32 52, ; 225
	i32 27, ; 226
	i32 9, ; 227
	i32 99, ; 228
	i32 46, ; 229
	i32 114, ; 230
	i32 48, ; 231
	i32 94, ; 232
	i32 106, ; 233
	i32 22, ; 234
	i32 17, ; 235
	i32 39, ; 236
	i32 29, ; 237
	i32 91, ; 238
	i32 36, ; 239
	i32 66, ; 240
	i32 92, ; 241
	i32 45, ; 242
	i32 66 ; 243
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.2xx @ 96b6bb65e8736e45180905177aa343f0e1854ea3"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
