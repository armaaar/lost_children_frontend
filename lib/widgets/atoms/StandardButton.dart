import 'package:flutter/material.dart';
import 'package:lost_children_frontend/settings/ThemeSettings.dart';

class StandardButton extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final void Function() onPressed;
  final BorderRadiusGeometry? borderRadius;

  const StandardButton({
    Key? key,
    this.text,
    this.icon,
    required this.onPressed,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(
          fontSize: ThemeSettings.fontSizeNormal,
          color: ThemeSettings.colorTextInvert,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: (ThemeSettings.spaceButton * 1.25).floor().toDouble(),
          vertical: ThemeSettings.spaceButton,
        ),
        shape: RoundedRectangleBorder(
          //to set border radius to button
          borderRadius:
              borderRadius ?? BorderRadius.circular(ThemeSettings.radiusButton),
        ),
      ),
      onPressed: onPressed,
      child: IntrinsicWidth(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            icon != null ? Icon(icon) : const SizedBox.shrink(),
            SizedBox(
              width: icon != null && text != null ? ThemeSettings.spaceText : 0,
            ),
            text != null ? Text(text!) : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
