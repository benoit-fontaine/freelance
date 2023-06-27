import 'package:flutter/material.dart';
import 'package:freelance/extensions/context_extensions.dart';
import 'package:freelance/widgets/markdown_it.dart';

import '../../components/title_view.dart';
import '../model/pricing_data.dart';
import '../model/pricing_data_extensions.dart';

class PricingPage extends StatefulWidget {
  final PricingData data;
  final Widget? footer;

  const PricingPage({
    Key? key,
    required this.data,
    this.footer,
  }) : super(key: key);

  @override
  State<PricingPage> createState() => _PricingPageState();
}

class _PricingPageState extends State<PricingPage>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 700),
    vsync: this,
  )..forward();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.data.backgroundTag,
      child: Container(
        width: context.mediaSize.width,
        height: context.mediaSize.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: widget.data.backgroundImage,
            fit: BoxFit.cover,
          ),
        ),
        child: FadeTransition(
          opacity: _animation,
          child: Card(
            margin: const EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 16,
              top: 30,
            ),
            color: const Color.fromRGBO(0, 0, 0, 0.6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TitleView(
                      tag: widget.data.titleTag,
                      title: widget.data.title,
                    ),
                    SizedBox(
                      width: context.mediaSize.width - 32,
                      height: context.mediaSize.height * .4,
                      child: MarkdownIt(
                        data: widget.data.markdownDescription,
                        fontColor: Colors.white,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: context.mediaSize.width - 32,
                  height: context.mediaSize.height * .6 - 134,
                  alignment: AlignmentDirectional.bottomCenter,
                  child: widget.footer,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}