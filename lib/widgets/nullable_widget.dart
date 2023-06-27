import 'package:flutter/material.dart';
import 'package:nil/nil.dart';

class NullableWidget extends StatelessWidget {
  final Widget? widget;
  const NullableWidget({Key? key, this.widget,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return widget ?? nil;
  }
}
