import 'package:flutter/material.dart';

import 'slide.dart';

class LandingPage extends StatelessWidget {
  final List<Widget> slides;

  const LandingPage({
    Key? key,
    required this.slides,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: slides.length,
      itemBuilder: (context, index) {
        return Slide( child: slides[index]);
      },
    );
  }
}
