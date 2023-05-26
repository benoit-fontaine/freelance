import 'package:flutter/material.dart';
import 'package:freelance/widgets/profile/form_events.dart';

import 'signup_button.dart';

class ForgivenPasswordButton extends StatelessWidget {
  final OnClick onClick;
  const ForgivenPasswordButton({
    Key? key,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: onClick,
            child: Text(
              "Mot de passe oublié ?",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
