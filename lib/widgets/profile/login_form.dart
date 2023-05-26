import 'package:flutter/material.dart';

import 'forgiven_password_button.dart';
import 'form_events.dart';
import 'form_title.dart';
import 'input_text.dart';
import 'login_bottom_signup.dart';
import 'white_button.dart';
import 'separator.dart';

class LoginForm extends StatelessWidget {
  final String? title;
  final DoLoginWithCredentials doLogin;
  final OnClick? goSubscribe;
  final OnClick goForgivenPassword;
  final String? errorMessage;

  const LoginForm({
    Key? key,
    this.title,
    required this.doLogin,
    this.goSubscribe,
    required this.goForgivenPassword,
    this.errorMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var username = TextEditingController();
    var password = TextEditingController();
    return Center(
      child: Card(
        color: const Color.fromRGBO(0, 0, 0, 0.6),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              FormTitle(
                title: title,
              ),
              const Separator(),
              InputText(
                icon: Icons.email,
                label: "email",
                keyboardType: TextInputType.emailAddress,
                controller: username,
                isOnError: errorMessage != null,
              ),
              const Separator(),
              InputText(
                icon: Icons.lock,
                label: "Mot de passe",
                keyboardType: TextInputType.visiblePassword,
                isPassword: true,
                controller: password,
                isOnError: errorMessage != null,
              ),
              ErrorMessage(
                errorMessage: errorMessage,
              ),
              const Separator(),
              WhiteButton(
                label: "Connexion",
                onClick: () {
                  doLogin(username.text, password.text);
                },
              ),
              SignupOrNull(
                goSubscribe: goSubscribe,
              ),
              ForgivenPasswordButton(onClick: goForgivenPassword),
            ],
          ),
        ),
      ),
    );
  }
}

class ErrorMessage extends StatelessWidget {
  final String? errorMessage;

  const ErrorMessage({
    Key? key,
    this.errorMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (errorMessage != null) {
      return Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.error,
                size: 15,
                color: Colors.redAccent,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  errorMessage!,
                  overflow: TextOverflow.fade,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.redAccent),
                ),
              ),
            ],
          ),
        ),
      );
    }
    return const SizedBox(height: 0);
  }
}

class SignupOrNull extends StatelessWidget {
  final OnClick? goSubscribe;

  const SignupOrNull({
    Key? key,
    this.goSubscribe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (goSubscribe == null) {
      return const SizedBox(
        height: 1,
      );
    }

    return LoginBottomSignup(
      onSignupRequest: () {
        goSubscribe!();
      },
    );
  }
}
