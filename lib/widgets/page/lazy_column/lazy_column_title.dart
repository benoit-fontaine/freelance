import 'package:flutter/material.dart';

class LazyColumnTitle extends StatelessWidget {
  final String title;

  const LazyColumnTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
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
