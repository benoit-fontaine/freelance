import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freelance/widgets/markdown_it.dart';
import 'package:freelance_example/components/selectable_number_card.dart';
import 'package:freelance_example/components/widgetbook.dart';
import 'package:widgetbook/widgetbook.dart';

void main() {
  runApp(const HotReload());
}

class HotReload extends StatelessWidget {
  const HotReload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      initialRoute: "/?path=readme%2Fintroduction",
      addons: [
        DeviceFrameAddon(devices: [
          Devices.android.smallPhone,
          Devices.android.samsungGalaxyS20,
          Devices.ios.iPhone13ProMax,
          Devices.ios.iPhoneSE,
          Devices.linux.laptop,
          Devices.windows.wideMonitor,
        ]),
      ],
      directories: [
        WidgetbookComponent(name: "README", useCases: [
          WidgetbookUseCase(
            name: "Introduction",
            builder: (BuildContext context) {
              return const LecteurMD(
                data: "${kDebugMode ? "" : "assets/"}markdown/introduction.md",
                fontColor: Colors.white,
              );
            },
          ),
        ]),
        WidgetbookFolder(name: "Widgets", children: [
          ...componentCategories(context),
        ]),
      ],
    );
  }
}

class LecteurMD extends StatefulWidget {
  final String data;
  final Color fontColor;

  const LecteurMD({super.key, required this.data, required this.fontColor});

  @override
  State<LecteurMD> createState() => _LecteurMDState();
}

class _LecteurMDState extends State<LecteurMD> {
  String _data = "";

  @override
  void initState() {
    super.initState();
    rootBundle.loadString(widget.data).then((value) => setState(() {
          _data = value;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return MarkdownIt(data: _data, fontColor: widget.fontColor);
  }
}
