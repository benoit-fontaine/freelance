import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

extension StringArrayExtensions on List<String> {
  List<Widget> toMarkdown(MarkdownStyleSheet? styleSheet) => 
      map((e) => Markdown(data: e, styleSheet: styleSheet)).toList();
}

extension WidgetListExtensions on List<Widget> {
  List<Widget> insertSeparator(Widget separator) {
    List<Widget> newList = toList();
    
    for (int i = 1; i < length; i += 2) {
      newList.insert(i, separator);
    }
    
    return newList;
  }
}