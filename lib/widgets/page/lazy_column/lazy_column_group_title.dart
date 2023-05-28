import 'package:flutter/material.dart';

class LazyColumnGroupTitle extends StatelessWidget {
  final String title;

  const LazyColumnGroupTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: SizedBox(
        height: 100,
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                shadows: [
                  Shadow(
                      color: Colors.black12,
                      offset: Offset.fromDirection(195.5, 5),
                      blurRadius: 2)
                ]),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
