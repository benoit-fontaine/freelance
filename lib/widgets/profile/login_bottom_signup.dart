import 'package:flutter/material.dart';
import 'package:freelance/widgets/profile/form_events.dart';

import 'signup_button.dart';

class LoginBottomSignup extends StatelessWidget {
  final OnClick onSignupRequest;
  const LoginBottomSignup({
    Key? key,
    required this.onSignupRequest,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Pas encore de compte ?',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.white),
          ),
          SignupButton(onClick: onSignupRequest,),
        ],
      ),
    );
  }
}
