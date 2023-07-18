import 'package:flutter/material.dart';
import 'package:freelance/extensions/context_extensions.dart';

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
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: isSelected ? Colors.black.withOpacity(0.3) : null,
              image: backgroundImage != null
                  ? DecorationImage(
                      image: backgroundImage!,
                      fit: BoxFit.cover,
                      colorFilter: isSelected
                          ? ColorFilter.mode(
                              Colors.black.withOpacity(0.3),
                              BlendMode.srcOver,
                            )
                          : null,
                    )
                  : null,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (value > 0) {
                          onChange(value - 1, isSelected);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(-5.0),
                      ),
                      child: const Text("-"),
                    ),
                    Text(
                      value.toString(),
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        onChange(value + 1, isSelected);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(-5.0),
                      ),
                      child: const Text("+"),
                    ),
                  ],
                ),
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
