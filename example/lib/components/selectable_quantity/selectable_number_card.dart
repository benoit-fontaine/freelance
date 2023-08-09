// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:freelance/widgets/components/selectable_number_card.dart';
import 'package:widgetbook/widgetbook.dart';

WidgetbookComponent selectableNumberCard(BuildContext context) {
  return WidgetbookComponent(
    name: "Carte",
    useCases: [
      WidgetbookUseCase(
        name: "avec image de fond",
        builder: (BuildContext context) {
          return SelectableNumberCard(
            title: context.knobs.string(
                label: "Titre de la carte", initialValue: "carte"),
            isSelected: context.knobs.boolean(
                label: "Est sélectionné", initialValue: false),
            value: int.parse(context.knobs.double
                .slider(
                label: "Valeur", initialValue: 1, min: 1, max: 99)
                .toStringAsFixed(0)),
            onChange: (value, isSelected) {},
            backgroundImage: const NetworkImage(
                "https://images.unsplash.com/photo-1676967016596-e1c519823ab9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE1fHx8ZW58MHx8fHx8&w=1000&q=80"),
          );
        },
      ),
      WidgetbookUseCase(
        name: "sans image de fond",
        builder: (BuildContext context) {
          return SelectableNumberCard(
            title: context.knobs.string(
                label: "Titre de la carte", initialValue: "carte"),
            isSelected: context.knobs.boolean(
                label: "Est sélectionné", initialValue: false),
            value: int.parse(context.knobs.double
                .slider(
                label: "Valeur", initialValue: 1, min: 1, max: 99)
                .toStringAsFixed(0)),
            onChange: (value, isSelected) {},
          );
        },
      ),
    ],
  );
}