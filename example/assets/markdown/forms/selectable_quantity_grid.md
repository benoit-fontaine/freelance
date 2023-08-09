Cet élément regourpe un ensemble de cartes à sélectionner avec une quantité pour chaque carte.

Cliquer sur une carte la sélectionne et les boutons + et - permettent de modifier la quantité pour chaque carte.

```dart
GridViewSelectableNumberCard(
    values: values,
    onChange: (index, quantity, isSelected) {
        setState(() {
        values[index].isSelected = isSelected;
        values[index].quantity = quantity;
    });
})
```

GridViwSelectableNumberCard est un widget qui prend en paramètre une liste de NumberCardValue et une fonction onChange qui est appelée à chaque fois qu'une carte est sélectionnée ou que la quantité change.

```dart
class NumberCardValue<T> {
  final T value;
  final String title;
  int quantity;
  bool isSelected;
  ImageProvider? image;

  NumberCardValue({
    required this.value,
    required this.title,
    this.quantity = 0,
    this.isSelected = false,
    this.image,
  });
}
```

le `T` représente le type de donnée qui sera sélectionné. Par exemple, si on veut sélectionner un `int`, on peut utiliser `NumberCardValue<int>`.