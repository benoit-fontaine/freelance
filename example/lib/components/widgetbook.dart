import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

import 'plus_moins_value.dart';
import 'selectable_number_card.dart';

List<WidgetbookCategory> componentCategories(BuildContext context) {
  return [
    WidgetbookCategory(name: "Formulaires", children: [
      selectableNumberCard(context),
      plusOuMoinsValue(context),
    ]),
  ];
}
