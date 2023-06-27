import 'package:flutter/material.dart';
import 'package:freelance/widgets/nullable_widget.dart';
import 'package:nil/nil.dart';

import 'components/background_image.dart';
import 'components/first_plan.dart';
import 'components/store_link_list.dart';
import 'model/store_link_data.dart';

class Cover extends StatelessWidget {
  final ImageProvider backgroundImage;
  final Widget? title;
  final Widget? bottom;
  final List<StoreLinkData> storeLinks;

  const Cover({
    super.key,
    required this.backgroundImage,
    this.title,
    this.bottom,
    this.storeLinks = const [],
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
          Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                NullableWidget(widget: bottom),
                StoreLinkList(links: storeLinks),
              ].where((element) => element != nil).toList()),
        ]),
      ],
    );
  }
}
