import 'package:flutter/material.dart';

extension MaterialSizeRatio on Size {
  SizeOrientation  get orientation {
    if (width > height) {
      return SizeOrientation.paysage;
    }
    if (height > width) {
      return SizeOrientation.portrait;
    }
    return SizeOrientation.carre;
  }

  double get max => (height > width) ? height : width;
  double get min => (height > width) ? width : height;

  double get vmax => max/100;
  double get vmin => min/100;
  double get vwidth => width/100;
  double get vheight => height/100;
}

enum SizeOrientation {
  portrait,
  paysage,
  carre
}