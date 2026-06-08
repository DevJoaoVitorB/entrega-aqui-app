import 'package:flutter/material.dart';

class StatCardModel {
  const StatCardModel({
    required this.label,
    required this.value,
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
    required this.accentColor,
  });

  final String label;
  final String value;
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final Color accentColor;
}
