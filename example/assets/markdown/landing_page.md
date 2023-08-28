Voyons ici comment fonctionnenent les composants de notre Landing Page.

## LandingPage

La LandingPage est un composant de base à tout nos éléments de présentation.
Il active ou non le scroll lorsque c'est nécessaire et contient des éléments de présentation.

```dart
  @override
  Widget build(BuildContext context) {
    return const LandingPage(
      slides: [
        Slide(
          child: SlideOne(),
        ),
        Slide(
          child: SlideTwo(),
        ),
      ],
    );
  }
```

Ici, les Slides sont des conteneurs qui font la taille de l'écran, comme un Slide de Powerpoint.

Il existe aussi d'autres composants de présentation qui n'ont pas besoin du `Slide` :

## Cover
```dart
  @override
  Widget build(BuildContext context) {
    return const Cover(
      backgroundImage: AssetImage('assets/images/cover.jpg'),
      title: Text('Cover'),
      bottom: Text('Bottom'),
      storeLinks: [
        StoreLinkData(
          image: AssetImage('assets/images/google-play-badge.png'),
          url: 'https://play.google.com/store/apps/details?id=com.google.android.apps.translate',
        ),
        StoreLinkData(
          image: AssetImage('assets/images/app-store-badge.png'),
          url: 'https://apps.apple.com/fr/app/google-traduction/id414706506',
        ),
      ],
      description: "Texte en **Markdown**",
    );
  }
```

Vous pouvez renseigner les éléments suivants :
- backgroundImage: Image de fond, ne peut pas être nulle. peut provenir des Assets ou d'internet directement. (Attention au temps de chargement) 
- title: Titre de la page, il s'agit ici d'un Widget, mettez ce que vous voulez.
- bottom, description et storeLinks: éléments qui seront affichés en bas de la page. `storeLinks` est une liste de `StoreLinkData` qui contient une image et une url.

## PricingList
```dart

var state = [
  PricingData(
    tag: "basic",
    title: "Basic",
    amount: 150,
    icon: Icons.home,
    backgroundImage:
    AssetImage("assets/images/basic.jpg"),
    markdownDescription: "Texte en markdown",
  ),
  PricingData(
    tag: "premium",
    title: "Premium",
    amount: 700,
    icon: Icons.update,
    backgroundImage:
    AssetImage("assets/images/basic.jpg"),
    markdownDescription: "Texte en markdown",
  ),
  PricingData(
    tag: "zero",
    title: "Prix à 0",
    amount: 0,
    icon: Icons.update,
    backgroundImage:
    AssetImage("assets/images/basic.jpg"),
    markdownDescription: "Texte en markdown",
  ),
  PricingData(
    tag: "noprice",
    title: "Sans prix",
    icon: Icons.update,
    backgroundImage:
    AssetImage("assets/images/basic.jpg"),
    markdownDescription: "Texte en markdown",
  ),
];

@override
Widget build(BuildContext context) =>
    PricingList(
        list: state.toList(),
        pricingWidget: (category) =>
            WhiteButton(
              label: "Commandez !",
              onClick: () {
                context.push("/new-order/${category.tag}");
              },
            )
    );
```

Vous pouvez renseigner les éléments suivants :
- list: liste de `PricingData` qui contient les éléments à afficher.
- pricingWidget: Widget qui sera affiché en bas de chaque élément. Il s'agit ici d'un bouton qui redirige vers une page de commande.