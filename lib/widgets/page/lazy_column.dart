export 'lazy_column/lazy_column_row.dart';
export 'lazy_column/lazy_column_title.dart';
export 'lazy_column/lazy_column_divider.dart';
export 'lazy_column/lazy_column_model.dart';
export 'lazy_column/lazy_column_extensions.dart';
export 'lazy_column/lazy_column_group_title.dart';

import 'package:flutter/material.dart';
import 'package:freelance/extensions/image_provider_extensions.dart';

class LazyColumn extends StatelessWidget {
  final Widget? title;
  final List<Widget> children;
  final ImageProvider? backgroundImage;
  final bool showGradient;

  const LazyColumn({
    Key? key,
    this.title,
    required this.children,
    this.backgroundImage,
    this.showGradient = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = children;
    if (title != null) {
      widgets.insert(0, title!);
    }
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: showGradient
            ? LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context).colorScheme.primary.withOpacity(0),
                  Theme.of(context).colorScheme.primary.withOpacity(.1),
                  Theme.of(context).colorScheme.primary.withOpacity(.3),
                ],
              )
            : null,
        image: backgroundImage?.toDecorationCoverImage(),
      ),
      child: ListView.builder(
        itemBuilder: (context, index) => widgets[index],
        itemCount: widgets.length,
      ),
    );
  }
}
