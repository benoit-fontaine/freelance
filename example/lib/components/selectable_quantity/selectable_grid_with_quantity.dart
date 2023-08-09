// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:freelance/widgets/components/gridview_selectable_number_card.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent selectableGridWithQuantity(BuildContext context) {
  return WidgetbookComponent(
    name: "Grille",
    useCases: [
      WidgetbookUseCase(
        name: "défaut",
        builder: (BuildContext context) {
          var quantity = context.knobs.double
              .slider(label: "Nombre de cartes", initialValue: 1, min: 1, max: 99, divisions: 99)
              .toInt();
          List<NumberCardValue<String>> values = [];
          for(int i = 0; i < quantity; i++) {
            values.add(NumberCardValue(value: "val $i", title: "carte $i", isSelected: false));
          }
          return SelectableGridWithQuantity(values: values);
        }
      )
    ],
  );
}


class SelectableGridWithQuantity extends StatefulWidget {
  final List<NumberCardValue<String>> values;
  const SelectableGridWithQuantity({super.key, required this.values});

  @override
  State<SelectableGridWithQuantity> createState() => _SelectableGridWithQuantityState();
}

class _SelectableGridWithQuantityState extends State<SelectableGridWithQuantity> {
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
