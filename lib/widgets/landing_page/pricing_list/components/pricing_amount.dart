import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PricingAmount extends StatelessWidget {
  final double amount;
  final bool isVisible;

  const PricingAmount({
    Key? key,
    required this.amount,
    required this.isVisible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var f = NumberFormat.currency(locale: "fr_FR", decimalDigits: 0, symbol: "€");
    
    if (!isVisible || amount <= 0) {
      return Text("");
    }
    
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Text(
          "À partir de \n${f.format(amount)}",
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headlineLarge
              ?.copyWith(
            color: Colors.white,
            shadows: const <Shadow>[
              Shadow(color: Colors.black, blurRadius: 15.0)
            ],
          ),
        ),
    );
  }
}
