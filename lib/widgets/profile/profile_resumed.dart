import 'package:flutter/material.dart';

import 'white_button.dart';
import 'form_events.dart';
import 'form_label.dart';
import 'form_title.dart';
import 'separator.dart';

class ProfileResumed extends StatelessWidget {
  final String userName;
  final String? additionalLabel;
  final OnClick goProfile;
  final OnClick logout;

  const ProfileResumed({
    Key? key,
    required this.userName,
    this.additionalLabel,
    required this.goProfile,
    required this.logout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                title: "Bonjour $userName,",
              ),
              const Separator(),
              FormLabel(
                text: additionalLabel,
              ),
              const Separator(),
              const FormLabel(
                text: "Vous pouvez commencer un devis",
              ),
              const FormLabel(
                text: "ou suivre vos commandes",
              ),
              const Separator(),
              WhiteButton(label: "Votre espace", onClick: goProfile),
              WhiteButton(label: "Se déconnecter", onClick: goProfile),
            ],
          ),
        ),
      ),
    );
  }
}
