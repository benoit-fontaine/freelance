Ici la saisie de texte sur une ligne.

```dart
InputText(
    label: "Hint text",
    initialValue: "test",
    onChange: (value) {
        print(value);
    },
)
```

On respecte ici la convention component de Flutter:
- `label` est le texte affiché au dessus de la saisie
- `initialValue` est la valeur initiale de la saisie
- `onChange` est le callback appelé quand la valeur change
