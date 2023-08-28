// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:freelance_package/components/landing_page.dart';
import 'package:widgetbook/widgetbook.dart';

import 'forms/input_text.dart';
import 'forms/selectable_quantity.dart';

List<WidgetbookCategory> componentCategories(BuildContext context) {
  return [
    WidgetbookCategory(name: "Formulaires", children: [
      selectableQuantity(context),
      inputText(context),
    ]),
  ];
}
