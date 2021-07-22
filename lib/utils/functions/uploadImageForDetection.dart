import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lost_children_frontend/settings/APISettings.dart';
import 'package:lost_children_frontend/store/ui/actions/loading.action.dart';
import 'package:lost_children_frontend/store/uploadedImage/actions/set.action.dart';
import 'package:lost_children_frontend/utils/GlobalRedux.dart';
import 'package:lost_children_frontend/utils/ImageSelector.dart';
import 'package:lost_children_frontend/utils/functions/getBackendError.dart';
import 'package:lost_children_frontend/interfaces/GeoLocation.dart';
import 'package:lost_children_frontend/utils/functions/showNavigationSnackBar.dart';
import 'package:lost_children_frontend/utils/functions/uploadImage.dart';
import 'package:http/http.dart' as http;
import 'package:lost_children_frontend/widgets/pages/SelectFacePage.dart';

enum ImageSelectionMethod { capture, select }

void uploadImageForDetection(
  BuildContext context,
  ImageSelectionMethod selectionMethod,
) async {
  // Get location
  final GeoLocation location;
  try {
    location = await GeoLocation.getCurrentLocation();
  } catch (e) {
    GlobalRedux.dispatch(DisableLoadingAction());
    return showNavigationSnackBar(
      context,
      e.toString(),
      isError: true,
    );
  }

  // Capture Image
  final XFile? image = selectionMethod == ImageSelectionMethod.select
      ? await ImageSelector().selectImage()
      : await ImageSelector().captureImage();
  if (image == null) return;

  // Send request
  GlobalRedux.dispatch(EnableLoadingAction());
  final http.Response response = await uploadImage(
    APISettings.detectUrl,
    image,
    <String, dynamic>{
      'state': 'lost',
      'location': location,
    },
  );
  GlobalRedux.dispatch(DisableLoadingAction());

  // handle error
  if (response.statusCode != 200) {
    return showNavigationSnackBar(
      context,
      getBackendError(response),
      isError: true,
    );
  }

  // Save marked image to store
  final Map<String, dynamic> responseObject =
      jsonDecode(response.body) as Map<String, dynamic>;

  final Uint8List markedImage =
      base64.decode(responseObject['image'].toString());

  GlobalRedux.dispatch(SetUploadedImageAction(
    markedImage: markedImage,
    facesHandlers: (responseObject['handlers'] as Map<String, dynamic>)
        .cast<String, int>(),
  ));

  // Navigate to select faces page
  Navigator.pushNamed(context, SelectFacePage.route);
}
