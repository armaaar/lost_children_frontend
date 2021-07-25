import 'package:flutter/material.dart';
import 'package:lost_children_frontend/settings/ThemeSettings.dart';

class Label extends StatelessWidget {
  final String text;
  final BorderRadiusGeometry? borderRadius;

  const Label({
    Key? key,
    required this.text,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        horizontal: (ThemeSettings.spaceText * 1.25).floor().toDouble(),
        vertical: ThemeSettings.spaceText,
      ),
      decoration: BoxDecoration(
        borderRadius:
            borderRadius ?? BorderRadius.circular(ThemeSettings.radiusButton),
        color: ThemeSettings.colorSwatch,
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: ThemeSettings.fontSizeNormal,
          color: ThemeSettings.colorTextInvert,
        ),
      ),
    );
  }
}
