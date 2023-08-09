import 'package:flutter/material.dart';
import 'package:freelance/widgets/components/forms/input_text.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent inputText(BuildContext context) {
  return WidgetbookComponent(name: "Saisie de texte", useCases: [
    WidgetbookUseCase(
        name: "défaut",
        builder: (BuildContext context) {
          return Card(
            color: Colors.white,
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: InputText(
                label:
                    context.knobs.string(label: "Label", initialValue: "Label"),
                initialValue:
                    context.knobs.string(label: "Valeur", initialValue: ""),
              ),
            ),
          );
        }),
  ]);
}
