import 'package:flutter/material.dart';
import 'package:freelance/widgets/landing_page/cover/components/bottom_widgets.dart';
import 'package:freelance/widgets/nullable_widget.dart';

import 'components/background_image.dart';
import 'components/first_plan.dart';
import 'model/store_link_data.dart';

class Cover extends StatelessWidget {
  final ImageProvider backgroundImage;
  final Widget? title;
  final Widget? bottom;
  final List<StoreLinkData> storeLinks;
  final String description;

  const Cover({
    super.key,
    required this.backgroundImage,
    this.title,
    this.bottom,
    this.storeLinks = const [],
    this.description = "",
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      fit: StackFit.expand,
      children: [
        BackgroundImage(
          image: backgroundImage,
        ),
        FirstPlan(children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: NullableWidget(widget: title),
          ),
          BottomWidgets(
            bottom: bottom,
            description: description,
            storeLinks: storeLinks,
          ),
        ]),
      ],
    );
  }
}

