import 'package:flutter/material.dart';
import 'package:freelance/widgets/profile/form_events.dart';

class WhiteButton extends StatelessWidget {
  final String label;
  final OnClick onClick;

  const WhiteButton({
    Key? key,
    required this.label,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
        ),
        onPressed: onClick,
        child: Text(
          label.toUpperCase(),
          style: TextStyle(
            color: Colors.blue.shade900,
            fontSize: 14.0,
          ),
        ),
      ),
    );
  }
}
