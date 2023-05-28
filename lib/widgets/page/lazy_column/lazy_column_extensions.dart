import 'package:flutter/material.dart';

import 'lazy_column_divider.dart';
import 'lazy_column_group_title.dart';
import 'lazy_column_model.dart';
import 'lazy_column_row.dart';
import 'lazy_column_title.dart';

extension LazyColumnModelWidgets on LazyColumnModel {
  List<Widget> toLazyColumnWidgets(List<Widget> otherRows) {
    List<Widget> list = [];
    list.add(
      LazyColumnTitle(
        title: title,
      ),
    );
    for (LazyColumGroupModel group in groups) {
      if (group.label.isNotEmpty) {
        list.add(LazyColumnGroupTitle(title: group.label));
      }
      for (int index = 0; index < group.rows.length; index++) {
        list.add(LazyColumnRow(
          label: group.rows[index].label,
          value: group.rows[index].value,
        ));
        if (index < group.rows.length - 1) {
          list.add(const LazyColumnDivider());
        }
      }
    }
    list.addAll(otherRows);
    return list;
  }
}
