import 'package:flutter/material.dart';
import 'package:freelance/extensions/context_extensions.dart';
import 'package:freelance/extensions/size_extensions.dart';

class AdaptiveDispatcher extends StatelessWidget {
  final Widget? desktop;
  final Widget? tablet;
  final Widget handset;
  final Widget? watch;

  const AdaptiveDispatcher({
    Key? key,
    this.desktop,
    this.tablet,
    required this.handset,
    this.watch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScreenType screenType = context.mediaSize.screenType;
    
    switch (screenType) {
      case ScreenType.desktop:
        return desktop ?? tablet ?? handset;
      case ScreenType.tablet:
        return tablet ?? desktop ?? handset;
      case ScreenType.watch:
        return watch ?? handset;
      default:
        return handset;
    }
  }
}
