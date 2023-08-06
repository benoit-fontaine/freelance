# Freelance, mon package pour Flutter

## Qui suis-je ?

Je suis **Benoît FONTAINE**

Après 23 ans d'expérience dans de nombreuses technologies (GED, BPMS, BI, ERP, Web, Mobile, etc.)
pour divers coeurs de métier (Baptiment, Travaux Publiques, Finances, Institutions, etc.),
Je souhaite aujourd'hui faire profiter de mon expérience dans le Software Craftmanship et le développement Front (Mobile, Web, Desktop).

Mes domaines d'espertise sont :
- Le développement front web et mobile (Flutter, React, Kotlin/Compose et Swift/SwiftUI)
- La formation (Flutter, Notion pour l'instant)
- Coaching et mentoring Software Craftmanship (TDD, BDD, DDD, Clean, etc)


Vous pouvez me suivre sur :
- Mon site : [benoitfontaine.fr](https://benoitfontaine.fr)
- Mon medium : [blog.benoitfontaine.fr](https://blog.benoitfontaine.fr)
- Mon notion : [bfontaine.notion.site](https://bfontaine.notion.site)
- Ma chaîne Youtube : [youtube.com/@benoitfontaine](https://www.youtube.com/@benoitfontaine)

## Qu'est-ce que Freelance ?

Freelance est un package dédié aux développements d'application en Flutter. Je l'ai créé et l'alimente au fûr et à mesure de mes besoins.
La règle est simple : Si, sur un projet, je dois réutiliser un widget, une fonction, une classe, etc. alors je le mets dans ce package.

Ce package est prévu pour fonctionner avec les plateforme `iOS`, `Android`, `Web`, `Linux`, `Windows`, `MacOSX`.

Les packages utilisés sont les suivants :

* [animations](https://pub.dev/packages/animations)
* [animator](https://pub.dev/packages/animator)
* [bloc](https://pub.dev/packages/bloc)
* [flutter_bloc](https://pub.dev/packages/flutter_bloc)
* [equatable](https://pub.dev/packages/equatable)
* [firebase_storage](https://pub.dev/packages/firebase_storage)
* [flutter_markdown](https://pub.dev/packages/flutter_markdown)
* [plugin_platform_interface](https://pub.dev/packages/plugin_platform_interface)
* [url_launcher](https://pub.dev/packages/url_launcher)
* [go_router](https://pub.dev/packages/go_router)
* [nil](https://pub.dev/packages/nil)
* [intl](https://pub.dev/packages/intl)
* [get_it](https://pub.dev/packages/get_it)
* [widgetbook](https://pub.dev/packages/widgetbook)

## Comment l'utiliser ?

Pour utiliser ce package, il suffit de l'ajouter dans votre fichier `pubspec.yaml` :

```yaml
dependencies:
  flutter:
    sdk: flutter
  freelance:
    git:
      url: https://github.com/benoit-fontaine/freelance.git
      ref: main
```

Si vous souhaitez piloter vos développements par les tests de comportements, vous pouvez ajouter les packages suivants :

```bash
flutter pub add bdd_widget_test build_runner --dev
```

Avant de commencer à développer, il faut générer les fichiers de tests de comportements :
``` bash
flutter packages pub run build_runner watch --delete-conflicting-outputs
```

Il ne reste qu'à ajouter vos fichiers `.feature` dans le dossier `lib/test`. Les steps s'ajouteront d'elles mêmes. Ils ne vous restera quà les compléter.

## Quel est cette page ?

Il s'agit tout simplement du Widgetbook généré pour mon package. Vous pourrez y tester les widgets et les fonctions que j'ai créé.

J'essaierai d'en faire une documentation complète au fur et à mesure de mes développements.