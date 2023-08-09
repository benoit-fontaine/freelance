// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:freelance/widgets/components/forms/input_text.dart';
import 'package:widgetbook/widgetbook.dart';

import '../../usecase_with_markdown.dart';

WidgetbookComponent inputText(BuildContext context) {
  return WidgetbookComponent(name: "Saisie de texte", useCases: [
    usercaseWithMarkdown(
      "Une seule ligne",
          (context) => Card(
            color: Colors.white,
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: InputText(
                label:
                context.knobs.string(label: "Label", initialValue: "Label"),
                initialValue:
                context.knobs.string(label: "Valeur", initialValue: ""),
              ),
            ),
          ),
      "markdown/forms/input_text.md",
    ),
  ]);
}
