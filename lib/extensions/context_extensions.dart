import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  Size get mediaSize => MediaQuery.of(this).size;
  Orientation get orientation => MediaQuery.of(this).orientation;
  ThemeData get theme => Theme.of(this);
}
