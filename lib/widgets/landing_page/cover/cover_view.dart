import 'package:flutter/material.dart';
import 'package:freelance/extensions/context_extensions.dart';
import 'package:freelance/extensions/size_extensions.dart';

class CoverView extends StatelessWidget {
  final ImageProvider backgroundImage;
  final Widget titleView;
  final Widget? bottomView;

  const CoverView({
    Key? key,
    required this.backgroundImage,
    required this.titleView,
    this.bottomView,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: context.mediaSize.width,
        height: context.mediaSize.height,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Image(
              image: backgroundImage,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            ConstrainedBox(
                constraints: const BoxConstraints.expand(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(15 * context.mediaSize.vmin),
                    child: titleView,
                  ),
                  bottomView ?? Container(),
                ],
              ),
            ),
            
          ],
        ));
  }
}
