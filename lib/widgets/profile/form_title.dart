import 'package:flutter/material.dart';

class FormTitle extends StatelessWidget {
  final String? title;

  const FormTitle({
    Key? key,
    this.title,
  }) : super(key: key);

  Widget titleToWidget(BuildContext context) {
    if (title != null) {
      return Text(
        title!,
        overflow: TextOverflow.fade,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.white,
            ),
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
      child: titleToWidget(context),
    );
  }
}
