// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:freelance_example/components/forms/input_text.dart';
import 'package:widgetbook/widgetbook.dart';

import 'selectable_quantity/plus_moins_value.dart';
import 'selectable_quantity/selectable_grid_with_quantity.dart';
import 'selectable_quantity/selectable_number_card.dart';

List<WidgetbookCategory> componentCategories(BuildContext context) {
  return [
    WidgetbookCategory(name: "Formulaires", children: [
      WidgetbookCategory(name: "Sélection avec quantité", children: [
        selectableNumberCard(context),
        plusOuMoinsValue(context),
        selectableGridWithQuantity(context),
      ]),
      inputText(context),
    ]),
  ];
}
