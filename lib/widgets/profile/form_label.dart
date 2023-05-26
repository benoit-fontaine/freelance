import 'package:flutter/material.dart';

class FormLabel extends StatelessWidget {
  final String? text;

  const FormLabel({
    Key? key,
    this.text,
  }) : super(key: key);

  Widget titleToWidget(BuildContext context) {
    if (text != null) {
      return Text(
        text!,
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: Colors.white),
      );
    }
    return const SizedBox(
      height: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          titleToWidget(context),
        ],
      ),
    );
  }
}
