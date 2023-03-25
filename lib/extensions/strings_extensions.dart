import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

extension StringArrayExtensions on List<String> {
  List<Widget> toMarkdown(MarkdownStyleSheet? styleSheet) => 
      map((e) => Markdown(data: e, styleSheet: styleSheet)).toList();
}