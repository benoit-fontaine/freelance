import 'package:flutter/material.dart';
import 'package:freelance/extensions/context_extensions.dart';

class Slide extends StatelessWidget {
  final Widget child;

  const Slide({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.mediaSize.width,
      height: context.mediaSize.height,
      child: child,
    );
  }
}
