import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SpeedDialInfo {
  final String label;
  final IconData icon;
  final IconData activeIcon;

  const SpeedDialInfo({
    required this.label,
    required this.icon,
    required this.activeIcon,
  });
}
