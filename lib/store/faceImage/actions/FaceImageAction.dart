import 'package:async_redux/async_redux.dart';
import 'package:lost_children_frontend/store/AppState.model.dart';
import 'package:lost_children_frontend/store/faceImage/FaceImage.model.dart';

abstract class FaceImageAction extends ReduxAction<AppState> {
  List<FaceImage> get faceImages => state.faceImages;

  List<FaceImage> reduceState();

  @override
  AppState reduce() {
    return state.copy(faceImages: reduceState());
  }
}
