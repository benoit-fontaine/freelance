import 'package:flutter/material.dart';

class PricingData {
  final String tag;
  final String title;
  final double? amount;
  final IconData icon;
  final ImageProvider backgroundImage;
  final String markdownDescription;

  const PricingData({
    required this.tag,
    required this.title,
    required this.amount,
    required this.icon,
    required this.backgroundImage,
    required this.markdownDescription,
  });
}
