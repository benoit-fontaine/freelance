import 'package:flutter/material.dart';

class LazyColumnDivider extends StatelessWidget {
  const LazyColumnDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Divider(
        color: Colors.black45,
      ),
    );
  }
}
