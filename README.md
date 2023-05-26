# Freelance

Package dédié aux développements d'application en Flutter.
À utiliser comme un Framework ou un toolkit, la première chose à faire sera de l'ajouter aux dependencies dans `pubspec.yaml`

Ce framework est prévu pour fonctionner avec les plateforme `iOS`, `Android`, `Web`, `Linux`, `Windows`, `MacOSX`.

Les outils utilisés :
* [url_launcher](https://pub.dev/packages/url_launcher)
* [flutter_markdown](https://pub.dev/packages/flutter_markdown)
* [equatable](https://pub.dev/packages/equatable)
* [carousel_slider](https://pub.dev/packages/carousel_slider)
* [firebase_storage](https://pub.dev/packages/firebase_storage)

Pour utiliser `url_launcher`, il faut configurer vos autorisations iOS et Android
Ajouter dans `/android/app/src/main/AndroidManifest.xml`
``` XML
    <!-- The INTERNET permission is required for development. Specifically,
         flutter needs it to communicate with the running application
         to allow setting breakpoints, to provide hot reload, etc.
    -->
    <uses-permission android:name="android.permission.INTERNET" />

    <!-- Provide required visibility configuration for API level 30 and above -->
    <queries>
        <!-- If your app checks for SMS support -->
        <intent>
            <action android:name="android.intent.action.VIEW" />
            <data android:scheme="sms" />
        </intent>
        <!-- If your app checks for call support -->
        <intent>
            <action android:name="android.intent.action.VIEW" />
            <data android:scheme="tel" />
        </intent>
        <!-- If your app checks for mail support -->
        <intent>
            <action android:name="android.intent.action.VIEW" />
            <data android:scheme="mailto" />
        </intent>
        <!-- If your app checks for web support -->
        <intent>
            <action android:name="android.intent.action.VIEW" />
            <data android:scheme="https" />
        </intent>
    </queries>
```
et dans `/ios/Runner/Info.plist`
``` XML
    <key>LSApplicationQueriesSchemes</key>
    <array>
        <string>sms</string>
        <string>tel</string>
        <string>https</string>
        <string>mailto</string>
    </array>
```

## Outils disponibles

### Extensions

#### BuildContext
* mediaSize: taille de l'écran ou de la fenêtre
* orientation: positionnement du device
* theme:  données ThemeData 

Utilisation :
``` dart
import 'package:flutter/services.dart';
import 'package:freelance/extensions/context_extensions.dart';

...

  @override
  Widget build(BuildContext context) {
    Size size = context.mediaSize;
    var orientation = context.orientation;
    
    
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
              'example app', 
              style: context.theme.textTheme.bodyLarge),
        ),
...
```

#### Size