import 'package:async_redux/async_redux.dart';
import 'package:lost_children_frontend/store/AppState.model.dart';
import 'package:lost_children_frontend/store/uploadedImage/UploadedImage.model.dart';

abstract class UploadedImageAction extends ReduxAction<AppState> {
  UploadedImage get uploadedImage => state.uploadedImage;
  UploadedImage reduceState();

  @override
  AppState reduce() {
    return state.copy(uploadedImage: reduceState());
  }
}
