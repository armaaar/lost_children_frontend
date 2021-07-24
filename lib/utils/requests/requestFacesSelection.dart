import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:lost_children_frontend/settings/APISettings.dart';
import 'package:lost_children_frontend/store/ui/actions/loading.action.dart';
import 'package:lost_children_frontend/store/uploadedImage/actions/clear.action.dart';
import 'package:lost_children_frontend/utils/BackendMessage.dart';
import 'package:lost_children_frontend/utils/GlobalRedux.dart';
import 'package:lost_children_frontend/utils/functions/sendRequest.dart';
import 'package:lost_children_frontend/utils/functions/showNavigationSnackBar.dart';
import 'package:lost_children_frontend/widgets/pages/LostListPage.dart';

void requestFacesSelection(BuildContext context, List<int> faces) async {
  // Make sure there is an image stored
  if (GlobalRedux.state.uploadedImage.isEmpty) {
    showNavigationSnackBar(
      context,
      'Error: No image found!',
      state: SnackBarState.error,
    );
    await Navigator.pushNamed(context, LostListPage.route);
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

  final BackendMessage backendMessage = BackendMessage.fromResponse(response);

  // handle error
  if (backendMessage.isError) {
    return showNavigationSnackBar(
      context,
      'Error: ${backendMessage.message}.',
      state: SnackBarState.error,
    );
  }

  showNavigationSnackBar(
    context,
    '${backendMessage.message}. Thank you for trying to Help!',
    state: SnackBarState.success,
  );
  await Navigator.pushNamed(context, LostListPage.route);
  GlobalRedux.dispatch(ClearUploadedImageAction());
}
