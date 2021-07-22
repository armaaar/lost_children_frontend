import 'package:flutter/material.dart';
import 'package:lost_children_frontend/settings/ThemeSettings.dart';

class StandardButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const StandardButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: ThemeSettings.fontSizeNormal),
        padding: EdgeInsets.symmetric(
          horizontal: ThemeSettings.spaceButton +
              (ThemeSettings.spaceButton / 4).floor(),
          vertical: ThemeSettings.spaceButton,
        ),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
