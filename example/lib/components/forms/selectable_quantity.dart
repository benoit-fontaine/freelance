// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freelance/widgets/components/gridview_selectable_number_card.dart';
import 'package:freelance/widgets/components/plus_moins_value.dart';
import 'package:freelance/widgets/components/selectable_number_card.dart';
import 'package:widgetbook/widgetbook.dart';

import '../../usecase_with_markdown.dart';

WidgetbookComponent selectableQuantity(BuildContext context) {
  var bg = const AssetImage(
      "${kDebugMode ? "" : "assets/"}images/bg-card.jpg");
  return WidgetbookComponent(name: "Sélection avec quantité", useCases: [
    usercaseWithMarkdown(
      "Grille",
      (BuildContext context) {
        var quantity = context.knobs.double
            .slider(
                label: "Nombre de cartes",
                initialValue: 6,
                min: 1,
                max: 99,
                divisions: 99)
            .toInt();
        List<NumberCardValue<String>> values = [];
        for (int i = 0; i < quantity; i++) {
          if (i % 2 == 0) {
            values.add(NumberCardValue(
                value: "val $i", title: "carte $i", isSelected: false));
          } else {
            values.add(NumberCardValue(
                value: "val $i",
                title: "carte $i",
                isSelected: false,
                image: bg));
          }
        }
        return SelectableGridWithQuantity(values: values);
      },
      "markdown/forms/selectable_quantity_grid.md",
    ),
    usercaseWithMarkdown(
      "Carte",
      (context) {
        String title =
            context.knobs.string(label: "Titre", initialValue: "Titre");
        int quantity = context.knobs.double
            .slider(
                label: "Quantité",
                initialValue: 1,
                min: 1,
                max: 99,
                divisions: 99)
            .toInt();
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SelectableNumberCard(
              title: title,
              value: quantity,
              isSelected: context.knobs
                  .boolean(label: "Premier Sélectionné", initialValue: false),
              onChange: (value, isSelected) {},
            ),
            SelectableNumberCard(
              title: title,
              value: quantity,
              isSelected: context.knobs
                  .boolean(label: "Second Sélectionné", initialValue: false),
              onChange: (value, isSelected) {},
              backgroundImage: bg,
            ),
          ],
        );
      },
      "markdown/forms/selectable_quantity_card.md",
    ),
    usercaseWithMarkdown(
      "Plus ou moins",
      (context) => WidgetPlusOuMoinsValue(
        initialValue: context.knobs.double
            .slider(
                label: "Valeur",
                initialValue: 1,
                min: 1,
                max: 99,
                divisions: 99)
            .toInt(),
      ),
      "markdown/forms/selectable_quantity_plus_moins.md",
    ),
  ]);
}

class WidgetPlusOuMoinsValue extends StatefulWidget {
  final int initialValue;

  const WidgetPlusOuMoinsValue({super.key, required this.initialValue});

  @override
  State<WidgetPlusOuMoinsValue> createState() => _WidgetPlusOuMoinsValueState();
}

class _WidgetPlusOuMoinsValueState extends State<WidgetPlusOuMoinsValue> {
  int _value = 0;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            width: 150,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white,
            ),
            child: PlusMoinsValue(
              value: _value,
              onChange: (value) {
                setState(() {
                  _value = value;
                });
              },
            )));
  }
}

class SelectableCardWithQuantity extends StatefulWidget {
  final String title;
  final bool isSelected;
  final int value;
  final ImageProvider? backgroundImage;

  const SelectableCardWithQuantity({
    super.key,
    required this.title,
    this.isSelected = false,
    this.value = 0,
    this.backgroundImage,
  });

  @override
  State<SelectableCardWithQuantity> createState() =>
      _SelectableCardWithQuantityState();
}

class _SelectableCardWithQuantityState
    extends State<SelectableCardWithQuantity> {
  @override
  Widget build(BuildContext context) {
    bool selected = widget.isSelected;
    int val = widget.value;
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white,
        ),
        alignment: Alignment.center,
        child: SelectableNumberCard(
          title: widget.title,
          isSelected: selected,
          value: val,
          onChange: (value, isSelected) {
            setState(() {
              selected = isSelected;
              val = value;
            });
          },
          backgroundImage: widget.backgroundImage,
        ));
  }
}

class SelectableGridWithQuantity extends StatefulWidget {
  final List<NumberCardValue<String>> values;

  const SelectableGridWithQuantity({super.key, required this.values});

  @override
  State<SelectableGridWithQuantity> createState() =>
      _SelectableGridWithQuantityState();
}

class _SelectableGridWithQuantityState
    extends State<SelectableGridWithQuantity> {
  List<NumberCardValue<String>> values = [];

  @override
  void initState() {
    super.initState();
    values = [...widget.values];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
      ),
      child: GridViewSelectableNumberCard(
        values: values,
        onChange: (index, quantity, isSelected) {
          setState(() {
            values[index].isSelected = isSelected;
            values[index].quantity = quantity;
          });
        },
      ),
    );
  }
}
