import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lost_children_frontend/settings/APISettings.dart';
import 'package:lost_children_frontend/store/ui/actions/loading.action.dart';
import 'package:lost_children_frontend/utils/GlobalRedux.dart';
import 'package:lost_children_frontend/utils/ImageSelector.dart';
import 'package:lost_children_frontend/utils/functions/showNavigationSnackBar.dart';
import 'package:lost_children_frontend/utils/functions/uploadImage.dart';
import 'package:http/http.dart' as http;

enum ImageSelectionMethod { capture, select }

void uploadImageForDetection(
  BuildContext context,
  ImageSelectionMethod selectionMethod,
) async {
  final XFile? image = selectionMethod == ImageSelectionMethod.select
      ? await ImageSelector().selectImage()
      : await ImageSelector().captureImage();
  if (image == null) return;
  GlobalRedux.dispatch(EnableLoadingAction());
  final http.Response response = await uploadImage(
    APISettings.detectUrl,
    image,
    <String, String>{'state': 'lost'},
  );
  GlobalRedux.dispatch(DisableLoadingAction());
  if (response.statusCode != 200) {
    showNavigationSnackBar(
      context,
      'Error: ${response.reasonPhrase}',
      isError: true,
    );
  }
}
