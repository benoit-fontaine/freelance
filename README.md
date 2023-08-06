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


## Contribuer

### Ajouter une fonctionnalité

Pour créer une fonctionnalité, il faut créer une branche à partir de la branche `dev` et la nommer `feature/<nom de la fonctionnalité>`.

Un fois sur cette branche, vous devez commencer par créer le fichier de test <nom de la fonctionnalité>.feature dans le dossier `features` et le fichier <nom de la fonctionnalité>_steps.dart dans le dossier `test`.
Un fois le fichier créé et avant même de commencer à écrire le Gherkin de la feature, lancez la commande :
``` bash
flutter packages pub run build_runner watch --delete-conflicting-outputs
```
Cette commande va générer les fichiers step correspondant à votre feature. Vous pouvez maintenant commencer à écrire votre feature.

Une fois la feature et les steps rédigés, vous pouvez lancer les tests avec la commande :
``` bash
flutter test
```

Le résultat des tests devrait être rouge (dans le cas contraire, c'est que vous avez oublié quelque chose).
Il ne vous reste qu'à coder votre fronctionnalité pour que les tests passent au vert.

#### Dans le cas d'un Widget

Si votre fonctionnalité contient ou consiste à avoir un ou plusieurs Widgets, vous devrez ajouter les éléments permettant l'interprétation de [Widgetbook](https://www.widgetbook.io/).

Commencez par lancer cette commande
``` bash
flutter packages pub run build_runner watch --delete-conflicting-outputs
```

Puis ajoutez en entête de vos Widgets les annotations suivantes :
``` dart
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'with green color',
  type: Container,
)
```

