import 'package:flutter/material.dart';
import 'package:freelance/extensions/context_extensions.dart';

class DividedScreen extends StatelessWidget {
  final WidgetBuilder elementBuilder;
  final int itemsLength;
  final Widget child;

  const DividedScreen({
    Key? key,
    required this.elementBuilder,
    required this.itemsLength,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool portrait = (context.mediaSize.width >= context.mediaSize.height);
    return SizedBox(
      width: context.mediaSize.width / (portrait ? itemsLength : 1),
      height: context.mediaSize.height / (portrait ? 1 : itemsLength),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: elementBuilder),
          );
        },
        child: child,
      ),
    );
  }
}
