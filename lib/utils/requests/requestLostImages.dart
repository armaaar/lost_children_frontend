import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:lost_children_frontend/settings/APISettings.dart';
import 'package:lost_children_frontend/store/faceImage/FaceImage.model.dart';
import 'package:lost_children_frontend/store/faceImage/actions/set.action.dart';
import 'package:lost_children_frontend/store/ui/actions/loading.action.dart';
import 'package:lost_children_frontend/utils/BackendMessage.dart';
import 'package:lost_children_frontend/utils/GlobalRedux.dart';
import 'package:lost_children_frontend/utils/functions/sendRequest.dart';
import 'package:lost_children_frontend/utils/functions/showNavigationSnackBar.dart';

Future<List<FaceImage>> requestLostImages(
  BuildContext context, {
  bool force = false,
}) async {
  List<FaceImage> result = <FaceImage>[];
  // Send request to backend
  if (GlobalRedux.state.faceImages.isNotEmpty && !force) {
    return GlobalRedux.state.faceImages;
  }
  GlobalRedux.dispatch(EnableLoadingAction());
  final http.Response response;
  if (GlobalRedux.state.searchedImageId == 0) {
    response = await sendRequest(APISettings.lostImages);
  } else {
    response = await sendRequest(
      APISettings.findImages,
      fields: <String, dynamic>{
        'imageId': GlobalRedux.state.searchedImageId,
      },
    );
  }
  GlobalRedux.dispatch(DisableLoadingAction());

  final BackendMessage backendMessage = BackendMessage.fromResponse(response);

  // handle error
  if (backendMessage.isError || backendMessage.responseObject == null) {
    showNavigationSnackBar(
      context,
      'Error: ${backendMessage.message}.',
      state: SnackBarState.error,
    );
  } else {
    result = (backendMessage.responseObject!['images'] as List<dynamic>)
        .map<FaceImage?>(
          (dynamic imageObject) =>
              FaceImage.fromJson(imageObject as Map<String, dynamic>),
        )
        .whereType<FaceImage>()
        .toList();
  }

  GlobalRedux.dispatch(SetFaceImageAction(newFaceImages: result));
  return result;
}
