import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

import 'generate_md_theme.dart';

class MarkdownIt extends StatelessWidget {
  final String data;
  final Color fontColor;

  const MarkdownIt({
    Key? key,
    required this.data,
    required this.fontColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Markdown(
        data: data,
        styleSheet: getMDTheme(context, Colors.white),
        onTapLink: (text, url, title) {
          if (url != null) {
            launchUrl(
              Uri.parse(url),
              mode: LaunchMode.platformDefault,
            );
          }
        });
  }
}
