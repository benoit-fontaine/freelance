import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  final ImageProvider image;

  const BackgroundImage({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Image(
      image: image,
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
    );
  }
}
