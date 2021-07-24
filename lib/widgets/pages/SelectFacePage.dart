import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lost_children_frontend/interfaces/NavigationItem.dart';
import 'package:lost_children_frontend/store/AppState.model.dart';
import 'package:lost_children_frontend/store/uploadedImage/UploadedImage.model.dart';
import 'package:lost_children_frontend/utils/functions/showNavigationSnackBar.dart';
import 'package:lost_children_frontend/utils/requests/requestFacesSelection.dart';
import 'package:lost_children_frontend/widgets/organisms/CheckboxListForm.dart';
import 'package:lost_children_frontend/widgets/pages/LostListPage.dart';
import 'package:lost_children_frontend/widgets/templates/StandardTemplate.dart';
import 'package:provider_for_redux/provider_for_redux.dart';
import 'package:confirm_dialog/confirm_dialog.dart';

class SelectFacePage extends StatelessWidget {
  static const String route = '/select-face';

  const SelectFacePage({
    Key? key,
  }) : super(key: key);

  Future<bool> isFacesReady(List<int> faces, BuildContext context) async {
    return faces.isNotEmpty ||
        await confirm(context,
            title: const Text('Confirm'),
            content: const Text(
                'You must select at least 1 face or the image will be discarded. Are you sure?'),
            textOK: const Text('Yes'),
            textCancel: const Text('No'));
  }

  @override
  Widget build(BuildContext context) {
    return ReduxSelector<AppState, dynamic>(
        selector: (_, AppState state) => <dynamic>[state.uploadedImage],
        builder: (BuildContext context, _, AppState state, __, ___, ____) {
          final UploadedImage uploadedImage = state.uploadedImage;

          if (uploadedImage.isEmpty) {
            scheduleMicrotask(() async {
              showNavigationSnackBar(
                context,
                'Error: No image found!!!!!!!!!!',
                state: SnackBarState.error,
              );
              await Navigator.pushNamed(context, LostListPage.route);
            });
            return const SizedBox();
          }

          return StandardTemplate(
            title: 'Select Faces',
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image.memory(
                  uploadedImage.markedImage!,
                  fit: BoxFit.contain,
                  width: double.infinity,
                  alignment: Alignment.center,
                ),
                CheckboxListForm<int>(
                  values: state.uploadedImage.facesHandlers!,
                  title: 'Select wanted faces',
                  buttonText: 'Select',
                  onSubmit: (List<int> faces) async {
                    if (!await isFacesReady(faces, context)) return;
                    requestFacesSelection(context, faces);
                  },
                )
              ],
            ),
            navigationItems: const <NavigationItem>[],
          );
        });
  }
}
