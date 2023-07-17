// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/jai_une_application_avec_un_cover_configure.dart';
import './step/je_dois_voir_mon_titre.dart';
import './step/je_dois_voir_ma_description.dart';
import './step/je_vois_un_bouton_avec_limage_mon_image.dart';
import './step/je_dois_voir_bottom_title.dart';
import './step/je_clique_sur_le_premier_bouton_disponible.dart';
import './step/je_suis_redirige_vers_mon_lien.dart';

void main() {
  group('''Landing Page''', () {
    testWidgets('''Affichage du Cover''', (tester) async {
      await jaiUneApplicationAvecUnCoverConfigure(tester);
      await jeDoisVoirMonTitre(tester);
      await jeDoisVoirMaDescription(tester);
      await jeVoisUnBoutonAvecLimageMonImage(tester);
      await jeVoisUnBoutonAvecLimageMonImage(tester);
      await jeDoisVoirBottomTitle(tester);
    });
    testWidgets('''Lancement d'un lien du Cover''', (tester) async {
      await jaiUneApplicationAvecUnCoverConfigure(tester);
      await jeCliqueSurLePremierBoutonDisponible(tester);
      await jeSuisRedirigeVersMonLien(tester);
    });
  });
}
