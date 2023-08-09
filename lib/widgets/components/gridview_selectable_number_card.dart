import 'package:flutter/material.dart';
import 'package:freelance/extensions/context_extensions.dart';

import 'selectable_number_card.dart';

class NumberCardValue<T> {
  final T value;
  final String title;
  int quantity;
  bool isSelected;
  ImageProvider? image;

  NumberCardValue({
    required this.value,
    required this.title,
    this.quantity = 0,
    this.isSelected = false,
    this.image,
  });
}

typedef OnChangeItem = void Function(int index, int quantity, bool isSelected);

class GridViewSelectableNumberCard<T> extends StatelessWidget {
  final List<NumberCardValue<T>> values;
  final OnChangeItem onChange;

  const GridViewSelectableNumberCard({
    super.key,
    this.values = const [],
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: context.mediaSize.width ~/ 150,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        ),
        itemCount: values.length,
        itemBuilder: (context, index) {
          final value = values[index];
          return SelectableNumberCard(
            title: value.title,
            isSelected: value.isSelected,
            value: value.quantity,
            onChange: (quantity, isSelected) {
              onChange(index, quantity, isSelected);
            },
            backgroundImage: value.image,
          );
        },
      ),
    );
  }
}
