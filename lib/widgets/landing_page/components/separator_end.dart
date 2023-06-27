import 'package:flutter/material.dart';

class SeparatorEnd extends StatelessWidget {
  final bool isPortrait;

  const SeparatorEnd({
    Key? key,
    required this.isPortrait,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isPortrait) {
      return Positioned(
        bottom: 0,
        top: 0,
        right: 0,
        child: Container(
          width: 2,
          color: Colors.white,
        ),
      );
    } else {
      return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          height: 2,
          color: Colors.white,
        ),
      );
    }
  }
}