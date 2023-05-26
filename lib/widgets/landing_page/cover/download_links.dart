import 'package:flutter/material.dart';
import 'package:freelance/extensions/context_extensions.dart';
import 'package:freelance/extensions/size_extensions.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DownloadLinks extends StatelessWidget {
  final String appStoreLink;
  final String playStoreLink;
  const DownloadLinks({
    Key? key,
    required this.appStoreLink,
    required this.playStoreLink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool portrait = (context.mediaSize.width >= context.mediaSize.height);
    return SizedBox(
      width: context.mediaSize.vmax * 50,
      height: context.mediaSize.vheight * 15,
      child: Flex(
        direction: portrait ? Axis.horizontal : Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () {
                launchUrlString(appStoreLink);
              },
              child: Image.asset(
                "assets/images/app-store.png",
                width: context.mediaSize.vmax * 20,
                fit: BoxFit.contain,
              )),
          TextButton(
              onPressed:  () {
                launchUrlString(playStoreLink);
              },
              child: Image.asset(
                "assets/images/google-play.png",
                width: context.mediaSize.vmax * 21,
                fit: BoxFit.contain,
              )),
        ],
      ),
    );
  }
}
