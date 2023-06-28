import 'package:flutter/material.dart';
import 'package:nil/nil.dart';

class FilteredColumn extends StatelessWidget {
  final Iterable<Widget> children;
  final Widget filter;

  const FilteredColumn({
    super.key,
    required this.children,
    this.filter = nil
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children.where((element) => element != filter).toList());
  }
}
