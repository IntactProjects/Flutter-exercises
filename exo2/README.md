# Exercise 2

Learn to compose layouts, call a web-service and integrate Google Maps

The app goal is to display agencies of in-Tact and Atecna as a list and as markers on a map. Currently however, both views are replaced by placeholders.

Initial | List | Map
--------|------|------
![initial](images/initial.png)|![list](images/list.png)|![map](images/map.png)

## Goals

### Agency list

List items follows the [Material specs](https://material.io/components/lists#specs) with these elements:

![list item](images/list-item.png)

Take a look at the [Cookbook](https://flutter.dev/docs/cookbook/lists/long-lists) for some pointers on how to create list in Flutter.

*Sideline stuff*

`agency.company` is represented by an enum `Company`. Both `label` and `logo` properties have been added to this enum with extension properties.

These could obviously have been represented by a proper class (it might even make more sense), but it is nonetheless interesting to see how extensions are done with Dart.

Take a look at [agency.dart](lib/domain/agency.dart) to see how it is done.

### Agency map

The map displays all agencies at the coordinates provided by `agency.position` and use the logo of their company as an icon. Clicking an agency opens a popup with the name of the city (`agency.city`) and the name of the company (`agency.company.label`).

![map item](images/map-item.png)

API keys have been prepared for Google Maps on the different platforms, but you are free to use Mapbox or any other provider of your preference

Platform| Google Maps API key
--------|---------------------
Android | AIzaSyB0_z7TX7gwWptMi7CaPc5WMKyNtGzJO08
iOS     | AIzaSyDork6umsMWcEecc4AbN27oKsYeztc2Hu4
Web     | AIzaSyBQcpEMvCU4K9cD9OIxdDfDPwgr48fyiK4

*LatLng and other Maps related classes*

To prevent having to convert our own `LatLng` (used by `agency.position`) to Google `LatLng`, you can simply comment all code from [map_domain.dart](lib/domain/map_domain.dart) and replace it by 

```
export 'package:google_maps_flutter/google_maps_flutter.dart';
```

This will import the classes provided by Google Maps in all files that import `map_domain.dart`

*Resources*

Helpful methods have been added to [map_utils.dart](lib/screen/dashboard/map/map_utils.dart):

 - `boundsFromLatLngList()` to create a `LatLngBounds` from a list of `LatLng`. This can be used to ensure all agencies are visible
 - `getBitmapDescriptorFromAssetBytes()` to prepare a marker icon from an asset image

*Sideline stuff*

Google Maps on Flutter is implemented as a [Platform View](https://flutter.dev/docs/development/platform-integration/platform-views) for Android and iOS. This means the view is rendered natively by the underlying platform, which comes with some caveats that you should learn about in the linked documentation. You can also take a look at the documentation of [`AndroidView`](https://api.flutter.dev/flutter/widgets/AndroidView-class.html) and [`UiKitView`](https://api.flutter.dev/flutter/widgets/UiKitView-class.html).


:bangbang: Google Maps integration can be a bit messy, don't forget to check the [Troubleshooting](#Troubleshooting) sections if you get into an issue

### Agency details

Clicking on a list item opens the details screen of the agency. At first, this screen will only display the name of the agency.

![initial](images/details1.png)

You will notice that the screen looks a bit broken. This is because no theme are provided to the screen, and the default style of a `TextField` is intentionaly ugly to make sure the developers fix that. This is easily fixed by wrapping the screen inside a Material widget like `Scaffold`.

#### Navigation

There is two [navigation and routing](https://flutter.dev/docs/development/ui/navigation) mechanisms in Flutter, and both can be used concurrently in different places of the same application.

Navigator 1.0 is original mechanism, and uses an imperative approach that is usually easier to grasp. This is the mechanism explained in the Flutter Cookbook recipes:

- [Navigate to a new screen and back](https://flutter.dev/docs/cookbook/navigation/navigation-basics)
- [Navigate with named routes](https://flutter.dev/docs/cookbook/navigation/named-routes.html)
- [Pass arguments to a named route](https://flutter.dev/docs/cookbook/navigation/navigate-with-arguments)

Navigator 2.0 was introduced in 2020 and uses a declarative approach that is closer to the rest of Flutter philosophy, but can be a bit harder to grasp. With Navigator 2.0, navigation is part of the application state and we can manipulate the whole screen/page stack. This is not possible with Navigator 1.0 that can only push and pop one screen/page at a time.

[Learning Flutter’s new navigation and routing system](https://medium.com/flutter/learning-flutters-new-navigation-and-routing-system-7c9068155ade)

You are free to choose the approach, knowing that the corrections are based on Navigator 1.0 (I'll try to implement a Navigator 2.0 approach later). 

:medal_sports: Bonus point if you are able to manage urls like http://localhost:1234/agency/2 to open the agency details screen with Flutter Web :)

#### Details layout

Here are the design elements for the agency details screen

Content                                       |Blueprint
----------------------------------------------|--------------------------------------------------
![content](images/details2-design-content.png)|![blueprint](images/details2-design-blueprint.png)

`fetchLorem()` is provided by [lorem_fetcher.dart](lib/utils/lorem_fetcher.dart). This method returns a `Future<List<String>>`, each string representing a paragraph. The future has a small delay to simulate a remote call. The screen should display a loader until the text content is available.

Text styles follows the [Material typography](https://material.io/design/typography/the-type-system.html#type-scale)

Don't hesitate to experiment with the widgets provided by Flutter. Try different layouts, add animations, etc.

*Resources*

 - [Layouts in Flutter](https://flutter.dev/docs/development/ui/layout)
 - [Basic Flutter layout concepts (Codelab)](https://flutter.dev/docs/codelabs/layout-basics)
 - [Widget catalog](https://flutter.dev/docs/development/ui/widgets)
 - [How to debug layout issues with the Flutter Inspector](https://medium.com/flutter/how-to-debug-layout-issues-with-the-flutter-inspector-87460a7b9db)

#### Hero animation

Add a Hero animation on the logo and agency label when switching between the list and the details screens. See the video below for an example:

![Hero animation](images/hero-animation.gif)

*Resources*

 - [Animate a widget across screens](https://flutter.dev/docs/cookbook/navigation/hero-animations)
 - [Hero animations](https://flutter.dev/docs/development/ui/animations/hero-animations)

#### HTTP Call (Lorem Ipsum)

Currently, [lorem_fetcher.dart](lib/utils/lorem_fetcher.dart) provides static content. 

The goal is to replace it with a call to the [Bacon Ipsum API](https://baconipsum.com/), like https://baconipsum.com/api/?type=meat-and-filler.
(Or another similar API if you don't like bacon :wink: )

*Resources*
 
 - [Fetch data from the internet](https://flutter.dev/docs/cookbook/networking/fetch-data)
 - [Networking & HTTP](https://flutter.dev/docs/development/data-and-backend/networking)
 - [JSON and serialization](https://flutter.dev/docs/development/data-and-backend/json)

## Troubleshooting

I encountered some problems while preparing this exercise, and it is likely you will encounter them too. Here is how I resolved them:

### Unable to run the project on the Web after adding Google Maps for the Web platform

![Error message](images/gmaps-web-error.png)

This happens because the exercise project use sound null-safety, while Google Maps for Flutter Web is not null-safe yet. 
As a result, the Dart compiler is unable to guarantee null-safety and fails with the above error.

To indicate to the compiler that we are ok with *unsound* null-safety, the flag `--no-sound-null-safety` must be used. For example: 
`$ flutter run --no-sound-null-safety -d chrome`

If you are using Visual Studio code, you can also run the project with "exo2 - disable sound null-safety".


### Application crashes when opening the map in release mode

![Error message](images/gmaps-android-release-error.png)

In Android, a special tool named ProGuard is usually run on release mode. The purpose of this tool is to obfuscate and minify the code, respectively to make it harder to reverse-engineer the application and remove any unused methods/classes/etc.

This tools is notoriously difficult to configure and in some cases a method will be removed or renamed that is actually used. This often happens when using reflection to call a method by its name, and I suppose the Google Maps plugin for Android has to rely on that.

To fix this, follow these steps:

1. Go to the `android/app/` folder
2. Create a `proguard-rules.pro` file. This will be used to configure ProGuard
3. In the `proguard-rules.pro` file, add the following line:

`-keep class androidx.lifecycle.DefaultLifecycleObserver`

This will instruct ProGuard to not rename nor remove the `DefaultLifecycleObserver` class that Google Maps relies on.

4. Open `android/app/build.gradle` file (it should already exists)
5. Locate the `release` configuration block inside the `buildTypes` block. It should be around line 45
6. Edit the `release` configuration block to provide ProGuard with the configuration file we just made:

```
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig signingConfigs.debug

            proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'
        }
```

To spot a ProGuard configuration issue in the future:

 - It only happens in Android release mode
 - You get a strange error message about a method not being accessible or not existing, while you are positive it should exist
 - The names of the class or method in the stacktrace are single letters like `io.flutter.plugins.googlemaps.h.a` (obfuscation)