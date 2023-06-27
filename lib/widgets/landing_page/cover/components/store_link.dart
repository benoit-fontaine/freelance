import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class StoreLink extends StatelessWidget {
  final String storeLink;
  final ImageProvider storeImage;

  const StoreLink({
    Key? key,
    required this.storeLink,
    required this.storeImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        launchUrlString(storeLink);
      },
      child: Image(
        image: storeImage,
        width: 150,
        fit: BoxFit.contain,
      ),
    );
  }
}
