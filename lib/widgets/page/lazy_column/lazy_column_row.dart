import 'package:flutter/material.dart';
import 'package:freelance/extensions/context_extensions.dart';

class LazyColumnRow extends StatelessWidget {
  final String label;
  final String value;

  const LazyColumnRow({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: context.mediaSize.width / 3,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                label,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          SizedBox(
            width: context.mediaSize.width / 3 * 2 - 40,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                value,
                textAlign: TextAlign.right,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
