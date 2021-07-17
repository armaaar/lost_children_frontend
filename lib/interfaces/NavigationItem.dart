import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationItem {
  final bool isPrimary;
  final bool onlyMobile;
  final String label;
  final IconData icon;
  final void Function(BuildContext)? onPress;

  const NavigationItem({
    this.isPrimary = false,
    this.onlyMobile = false,
    required this.label,
    required this.icon,
    this.onPress,
  });
}
