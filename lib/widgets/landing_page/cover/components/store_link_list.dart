import 'package:flutter/material.dart';

import '../model/store_link_data.dart';
import 'store_link.dart';

class StoreLinkList extends StatelessWidget {
  final List<StoreLinkData> links;

  const StoreLinkList({
    Key? key,
    required this.links,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: links
            .map(
              (st) => StoreLink(
                storeLink: st.link,
                storeImage: st.image,
              ),
            )
            .toList(),
      ),
      /*GridView.count(
        primary: false,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: links
            .map(
              (st) => StoreLink(
                storeLink: st.link,
                storeImage: st.image,
              ),
            )
            .toList(),
      ),*/
    );
  }
}
