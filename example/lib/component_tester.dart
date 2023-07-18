import 'package:flutter/material.dart';

class WidgetTester extends StatelessWidget {
  final Widget? child;
  const WidgetTester({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Widget Tester"),
        ),
        body: Center(
          child: child,
        ),
      ),
    );
  }
}
