import 'package:flutter/material.dart';
import 'package:freelance/widgets/profile/form_events.dart';

class SignupButton extends StatelessWidget {
  final OnClick onClick;
  const SignupButton({
    Key? key,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        "Inscrivez-vous",
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
