import 'package:flutter/material.dart';

extension ImageProviderExtensions on ImageProvider {
  DecorationImage toDecorationCoverImage({double? opacity}) => DecorationImage(
        image: this,
        fit: BoxFit.cover,
        opacity: opacity ?? 1,
      );
}
