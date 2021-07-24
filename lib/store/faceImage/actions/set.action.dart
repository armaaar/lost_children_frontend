import 'package:lost_children_frontend/store/faceImage/FaceImage.model.dart';
import 'package:lost_children_frontend/store/faceImage/actions/FaceImageAction.dart';

class SetFaceImageAction extends FaceImageAction {
  List<FaceImage> newFaceImages;

  SetFaceImageAction({
    required this.newFaceImages,
  });

  @override
  List<FaceImage> reduceState() => newFaceImages;
}
