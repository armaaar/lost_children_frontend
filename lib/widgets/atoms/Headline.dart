import 'package:flutter/material.dart';
import 'package:lost_children_frontend/settings/ThemeSettings.dart';

class Headline extends StatelessWidget {
  final String text;
  final Alignment alignment;

  const Headline({
    Key? key,
    required this.text,
    this.alignment = Alignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(ThemeSettings.spaceSection),
      alignment: alignment,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: ThemeSettings.fontSizeHeadline,
        ),
      ),
    );
  }
}
