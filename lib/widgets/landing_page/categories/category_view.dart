import 'package:flutter/material.dart';
import 'package:freelance/extensions/context_extensions.dart';
import 'package:freelance/extensions/size_extensions.dart';
import 'package:freelance/widgets/markdown_it.dart';

import 'category_model.dart';

class CategoryView extends StatefulWidget {
  final CategoryModel category;
  final Widget footer;

  const CategoryView({
    Key? key,
    required this.category,
    required this.footer,
  }) : super(key: key);

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView>
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
      tag: widget.category.backgroundTag,
      child: Container(
        width: context.mediaSize.width,
        height: context.mediaSize.height,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: widget.category.backgroundImage,
          fit: BoxFit.cover,
        )),
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
              children: [
                TitleView(
                    tag: widget.category.titleTag,
                    title: widget.category.title),
                SizedBox(
                  width: context.mediaSize.width - 32,
                  height: context.mediaSize.vheight * 50,
                  child: MarkdownIt(
                    data: widget.category.markdownDescription,
                    fontColor: Colors.white,
                  ),
                ),
                Container(
                  width: context.mediaSize.width - 32,
                  height: context.mediaSize.vheight * 50 - 134,
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
