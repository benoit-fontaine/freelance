// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:freelance_package/components/landing_page.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'components/widgetbook.dart';
import 'usecase_with_markdown.dart';

void main() {
  usePathUrlStrategy();
  runApp(const HotReload());
}

class HotReload extends StatelessWidget {
  const HotReload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      initialRoute: "/?path=%2Freadme",
      addons: [
        DeviceFrameAddon(devices: [
          ...Devices.android.all,
          ...Devices.ios.all,
          Devices.linux.laptop,
          Devices.windows.wideMonitor,
        ]),
      ],
      directories: [
        WidgetbookComponent(name: "", useCases: [
          usercaseWithMarkdown(
            "README",
            null,
            "markdown/introduction.md",
          ),
        ]),
        landingPage(context),
        ...componentCategories(context),
      ],
    );
  }
}
