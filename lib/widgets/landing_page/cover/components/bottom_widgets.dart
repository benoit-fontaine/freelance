import 'package:flutter/material.dart';
import 'package:freelance/extensions/context_extensions.dart';
import 'package:freelance/widgets/markdown_it.dart';
import 'package:freelance/widgets/nullable_widget.dart';
import 'package:nil/nil.dart';

import '../model/store_link_data.dart';
import 'filtered_column.dart';
import 'store_link_list.dart';

class BottomWidgets extends StatelessWidget {
  final Widget? bottom;
  final List<StoreLinkData> storeLinks;
  final String description;

  const BottomWidgets({
    super.key,
    this.bottom,
    this.storeLinks = const [],
    this.description = "",
  });

  @override
  Widget build(BuildContext context) {
    bool portrait = (context.mediaSize.width <= context.mediaSize.height);
    if (portrait || description.isEmpty) {
      return FilteredColumn(
        children: [
          NullableWidget(widget: bottom),
          StoreLinkList(links: storeLinks),
        ],
      );
        
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            NullableWidget(widget: bottom),
            StoreLinkList(links: storeLinks),
          ].where((element) => element != nil).toList());
    }
    return FilteredColumn(
      children: [
        Card(
          color: const Color.fromRGBO(0, 0, 0, 0.5),
          child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FilteredColumn(
                    children: [
                      SizedBox(
                        width: context.mediaSize.width - 500,
                        height: 300,
                        child: MarkdownIt(
                          data: description,
                          fontColor: Colors.white,
                        ),
                      ),
                      StoreLinkList(links: storeLinks),
                    ],
                  ),
                  NullableWidget(widget: bottom),
                ],
              ),
          ),
        ),
      ]
    );
  }
}
