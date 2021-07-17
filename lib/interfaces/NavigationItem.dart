import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationItem {
  bool isPrimary;
  String title;
  IconData icon;
  void Function(BuildContext)? onPress;

  NavigationItem({
    this.isPrimary = false,
    required this.title,
    required this.icon,
    this.onPress,
  });
}
