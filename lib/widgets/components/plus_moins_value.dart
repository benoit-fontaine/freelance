import 'package:flutter/material.dart';

class PlusMoinsValue extends StatelessWidget {
  final int value;
  final void Function(int value) onChange;

  const PlusMoinsValue({
    super.key,
    required this.value,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 40,
            child: ElevatedButton(
              onPressed: () {
                if (value > 0) {
                  onChange(value - 1);
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(0),
                alignment: Alignment.center,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                  ),
                ),
              ),
              child: Text(
                "-",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall,
              ),
            ),
          ),
          Text(
            value.toString(),
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(
            width: 45,
            child: ElevatedButton(
              onPressed: () {
                onChange(value + 1);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(0),
                alignment: Alignment.center,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                  ),
                ),
              ),
              child: Text(
                "+",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
