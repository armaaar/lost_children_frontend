import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:lost_children_frontend/settings/APISettings.dart';
import 'package:lost_children_frontend/store/ui/actions/loading.action.dart';
import 'package:lost_children_frontend/store/uploadedImage/actions/clear.action.dart';
import 'package:lost_children_frontend/utils/GlobalRedux.dart';
import 'package:lost_children_frontend/utils/functions/getBackendError.dart';
import 'package:lost_children_frontend/utils/functions/sendRequest.dart';
import 'package:lost_children_frontend/utils/functions/showNavigationSnackBar.dart';
import 'package:lost_children_frontend/widgets/pages/HomePage.dart';

void requestFacesSelection(BuildContext context, List<int> faces) async {
  // Make sure there is an image stored
  if (GlobalRedux.state.uploadedImage.isEmpty) {
    showNavigationSnackBar(
      context,
      'Error: No image found!',
      state: SnackBarState.error,
    );
    await Navigator.pushNamed(context, HomePage.route);
    return;
  }

  // Send request to backend
  GlobalRedux.dispatch(EnableLoadingAction());
  final http.Response response = await sendRequest(
    APISettings.select,
    fields: <String, dynamic>{
      'imageId': GlobalRedux.state.uploadedImage.imageId,
      'faceIds': faces
    },
  );
  GlobalRedux.dispatch(DisableLoadingAction());

  // handle error
  if (response.statusCode != 200) {
    return showNavigationSnackBar(
      context,
      getBackendError(response),
      state: SnackBarState.error,
    );
  }

  showNavigationSnackBar(
    context,
    'Image Uploaded successfully. Thank you for your Help!',
    state: SnackBarState.success,
  );
  await Navigator.pushNamed(context, HomePage.route);
  GlobalRedux.dispatch(ClearUploadedImageAction());
}
