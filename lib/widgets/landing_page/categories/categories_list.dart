import 'package:flutter/material.dart';
import 'package:freelance/extensions/context_extensions.dart';
import 'package:freelance/extensions/size_extensions.dart';
import 'package:freelance/widgets/landing_page/categories/category_view.dart';

import 'category_model.dart';

typedef DetailWidget = Widget Function(CategoryModel category);

class CategoriesList extends StatelessWidget {
  final List<CategoryModel> categories;
  final DetailWidget categoryWidget; 

  const CategoriesList({
    Key? key,
    required this.categories,
    required this.categoryWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool portrait = (context.mediaSize.width >= context.mediaSize.height);
    return Flex(
      direction: portrait ? Axis.horizontal : Axis.vertical,
      children: categories
          .map((e) => SizedBox(
                width: context.mediaSize.width /
                    (portrait ? categories.length : 1),
                height: context.mediaSize.height /
                    (portrait ? 1 : categories.length),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CategoryView(
                              category: e,
                            footer: categoryWidget(e),
                          )),
                    );
                  },
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
                                    Shadow(
                                        color: Colors.black, blurRadius: 15.0)
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
              ))
          .toList(),
    );
  }
}

class SeparatorEnd extends StatelessWidget {
  final bool isPortrait;

  const SeparatorEnd({
    Key? key,
    required this.isPortrait,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isPortrait) {
      return Positioned(
        bottom: 0,
        top: 0,
        right: 0,
        child: Container(
          width: 2,
          color: Colors.white,
        ),
      );
    } else {
      return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          height: 2,
          color: Colors.white,
        ),
      );
    }
  }
}

class SeparatorBegin extends StatelessWidget {
  final bool isPortrait;

  const SeparatorBegin({
    Key? key,
    required this.isPortrait,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isPortrait) {
      return Positioned(
        bottom: 0,
        top: 0,
        left: 0,
        child: Container(
          width: 2,
          color: Colors.white,
        ),
      );
    } else {
      return Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: Container(
          height: 2,
          color: Colors.white,
        ),
      );
    }
  }
}
