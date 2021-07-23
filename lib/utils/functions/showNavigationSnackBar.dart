import 'package:flutter/material.dart';
import 'package:lost_children_frontend/settings/ThemeSettings.dart';

enum SnackBarState { normal, error, success }

Map<SnackBarState, Color?> _stateToColor = <SnackBarState, Color?>{
  SnackBarState.normal: null,
  SnackBarState.error: ThemeSettings.colorError,
  SnackBarState.success: ThemeSettings.colorSuccess,
};

void showNavigationSnackBar(BuildContext context, String message,
    {SnackBarState state = SnackBarState.normal}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: _stateToColor[state],
    ),
  );
}
