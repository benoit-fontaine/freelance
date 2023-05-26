import 'package:flutter/material.dart';

class SlidesPresentation extends StatefulWidget {
  final List<Widget> slides;

  const SlidesPresentation({
    Key? key,
    required this.slides,
  }) : super(key: key);

  @override
  State<SlidesPresentation> createState() => _SlidesPresentationState();
}

class _SlidesPresentationState extends State<SlidesPresentation> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.slides.length,
      itemBuilder: (context, index) {
        return widget.slides[index];
      },
    );
  }
}
