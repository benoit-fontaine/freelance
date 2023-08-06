import 'package:flutter/material.dart';
import 'package:freelance/widgets/components/plus_moins_value.dart';

typedef OnChangeSelectionAndNumber = void Function(int value, bool isSelected);

class SelectableNumberCard extends StatelessWidget {
  final String title;
  final bool isSelected;
  final int value;
  final OnChangeSelectionAndNumber onChange;
  final ImageProvider? backgroundImage;

  const SelectableNumberCard({
    super.key,
    this.title = "",
    required this.isSelected,
    required this.value,
    required this.onChange,
    this.backgroundImage,
  });

  static const double _selectedElevation = 1.0;
  static const double _notSelectedElevation = 8.0;
  static const Color _selectedColor = Color.fromRGBO(0, 0, 0, .1);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 150,
      child: Card(
        elevation: isSelected ? _selectedElevation : _notSelectedElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(15.0),
          onTap: () {
            onChange(value, !isSelected);
          },
          child: Container(
            padding: const EdgeInsets.all(0),
            margin: const EdgeInsets.all(0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: isSelected ? _selectedColor : null,
              image: backgroundImage != null
                  ? DecorationImage(
                      image: backgroundImage!,
                      fit: BoxFit.cover,
                      colorFilter: isSelected
                          ? const ColorFilter.mode(
                              _selectedColor,
                              BlendMode.srcOver,
                            )
                          : null,
                    )
                  : null,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PlusMoinsValue(
                    value: value,
                    onChange: (value) {
                      onChange(value, isSelected);
                    }),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
