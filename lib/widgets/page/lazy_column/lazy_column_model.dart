class LazyColumnModel {
  final String title;
  final List<LazyColumGroupModel> groups;

  const LazyColumnModel({
    required this.title,
    required this.groups,
  });
}

class LazyColumGroupModel {
  final String label;
  final List<LazyColumnRowModel> rows;

  const LazyColumGroupModel({
    this.label = "",
    required this.rows,
  });
}

class LazyColumnRowModel {
  final String label;
  final String value;

  const LazyColumnRowModel(
    this.label,
    this.value,
  );
}
