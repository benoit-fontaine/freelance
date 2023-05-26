// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class CategoryModel {
  final String tag;
  final String title;
  final IconData icon;
  final ImageProvider backgroundImage;
  final String markdownDescription;

  const CategoryModel({
    required this.tag,
    required this.title,
    required this.icon,
    required this.backgroundImage,
    required this.markdownDescription,
  });
  
  String get backgroundTag => tag + TAG_BG_SUFFIX;
  String get titleTag => tag + TAG_TITLE_SUFFIX;
  String get iconTag => tag + TAG_ICON_SUFFIX;
}


const String TAG_BG_SUFFIX = "_image";
const String TAG_TITLE_SUFFIX = "_title";
const String TAG_ICON_SUFFIX = "_icon";