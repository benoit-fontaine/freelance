import 'package:flutter/material.dart';
import 'package:freelance/extensions/context_extensions.dart';

class TitleView extends StatelessWidget {
  final String tag;
  final String title;

  const TitleView({
    Key? key,
    required this.tag,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.mediaSize.width - 32,
      height: 68,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              shadows: <Shadow>[Shadow(color: Colors.black, blurRadius: 15.0)],
            ),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            textWidthBasis: TextWidthBasis.longestLine,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
              color: Colors.white,
              shadows: const <Shadow>[
                Shadow(color: Colors.black, blurRadius: 15.0)
              ],
            ),
          ),
        ],
      ),
    );
  }
}