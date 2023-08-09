Cet élément permet de sélectionner une quantité en utilisant les boutons plus et moins.

On peut aller de 0 à 99.

``` dart
PlusMoinsValue(
  value: _value,
  onChange: (value) {
    setState(() {
      _value = value;
    });
  },
);
```

On respecte ici la convention component de Flutter: 
- `value` est la valeur de l'élément
- `onChange` est le callback appelé quand la valeur change