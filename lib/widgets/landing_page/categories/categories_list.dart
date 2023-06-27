import 'package:flutter/material.dart';
import 'package:freelance/extensions/context_extensions.dart';
import 'package:freelance/extensions/size_extensions.dart';
import 'package:freelance/widgets/landing_page/categories/category_view.dart';

import '../components/detail_widget.dart';
import '../components/separator_begin.dart';
import '../components/separator_end.dart';
import 'category_model.dart';

class CategoriesList extends StatelessWidget {
  final List<CategoryModel> categories;
  final DetailWidget<CategoryModel> categoryWidget; 

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
