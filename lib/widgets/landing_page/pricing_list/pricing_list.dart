import 'package:flutter/material.dart';
import 'package:freelance/extensions/context_extensions.dart';
import 'package:freelance/extensions/size_extensions.dart';
import 'package:freelance/widgets/landing_page/components/divided_screen.dart';
import 'package:freelance/widgets/landing_page/pricing_list/components/pricing_amount.dart';

import '../components/detail_widget.dart';
import '../components/separator_begin.dart';
import '../components/separator_end.dart';
import 'components/pricing_page.dart';
import 'model/pricing_data.dart';
import 'model/pricing_data_extensions.dart';

class PricingList extends StatelessWidget {
  final List<PricingData> list;
  final DetailWidget<PricingData> pricingWidget;

  const PricingList({
    Key? key,
    required this.list,
    required this.pricingWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool portrait = (context.mediaSize.width >= context.mediaSize.height);
    return Flex(
      direction: portrait ? Axis.horizontal : Axis.vertical,
      children: list
          .map(
            (e) => DividedScreen(
              itemsLength: list.length,
              elementBuilder: (context) => PricingPage(
                data: e,
                footer: pricingWidget(e),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Hero(
                    tag: e.backgroundTag,
                    child: Image(
                      image: e.backgroundImage,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SeparatorBegin(isPortrait: portrait),
                  SeparatorEnd(isPortrait: portrait),
                  PricingAmount(amount: e.amount ?? 0, isVisible: portrait),
                  Flex(
                    direction: portrait ? Axis.vertical : Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Hero(
                          tag: e.titleTag,
                          child: Text(
                            e.title,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(
                              color: Colors.white,
                              shadows: const <Shadow>[
                                Shadow(color: Colors.black, blurRadius: 15.0)
                              ],
                            ),
                          ),
                        ),
                      ),
                      Hero(
                        tag: e.iconTag,
                        child: Icon(
                          e.icon,
                          color: Colors.white,
                          size: 5 * context.mediaSize.vmax,
                          shadows: const <Shadow>[
                            Shadow(color: Colors.black, blurRadius: 15.0)
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
