Il s'agit ici d'une carte permettant de sélectionner une quantité en utilisant les boutons plus et moins.

Cliquer dessus la sélectionne et les bouton + et - permettent de modifier la quantité.

```dart
SelectableNumberCard(
  title: "Titre",
  isSelected: _selected,
  value: _value,
  onChange: (value, isSelected) {
    setState(() {
        _value = value;
        _selected = isSelected;
    });
  },
  backgroundImage: AssetImage("assets/images/placeholder.png"),
)
```

On respecte ici la convention component de Flutter:
- `title` est le titre de la carte
- `isSelected` est un booléen indiquant si la carte est sélectionnée
- `value` est la quantité de l'élément
- `onChange` est le callback appelé quand la valeur change (sélection ou quantité)
- `backgroundImage` est l'image de fond de la carte (peut être null)
