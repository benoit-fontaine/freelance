// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:freelance/widgets/landing_page.dart';
import 'package:widgetbook/widgetbook.dart';

import '../usecase_with_markdown.dart';

WidgetbookComponent landingPage(BuildContext context) {
  return WidgetbookComponent(name: "Landing page", useCases: [
    usercaseWithMarkdown(
      "Global",
      (context) => Center(
        child: ElevatedButton(
          onPressed: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LandingPageDemo(),
              ),
            ),
          },
          child: const Text("Lancer la Landing Page"),
        ),
      ),
      "markdown/landing_page.md",
    ),
  ]);
}

class LandingPageDemo extends StatelessWidget {
  const LandingPageDemo({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: LandingPage(
      slides: [
        Cover(
          backgroundImage: const AssetImage("assets/images/bg-cover.jpg"),
          title: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  shadows: <Shadow>[
                    Shadow(color: Colors.black, blurRadius: 15.0)
                  ],
                ),
              ),
              const Text("Archifacile"),
            ],
          ),
        ),
      ],
    )
  );
}
