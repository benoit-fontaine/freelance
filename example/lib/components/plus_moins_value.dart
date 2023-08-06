import 'package:flutter/material.dart';
import 'package:freelance/widgets/components/plus_moins_value.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent plusOuMoinsValue(BuildContext context) {
  return WidgetbookComponent(name: "Sélecteur de quantité", useCases: [
    WidgetbookUseCase(
        name: "défaut",
        builder: (BuildContext context) {
          return WidgetPlusOuMoinsValue(
              initialValue: context.knobs.double
                  .slider(label: "Valeur", initialValue: 1, min: 1, max: 99, divisions: 99)
                  .toInt());
        }),
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
    return Container(
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
        ));
  }
}
