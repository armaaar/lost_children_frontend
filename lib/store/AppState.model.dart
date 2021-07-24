import 'package:lost_children_frontend/store/faceImage/FaceImage.model.dart';
import 'package:lost_children_frontend/store/ui/UI.model.dart';
import 'package:lost_children_frontend/store/uploadedImage/UploadedImage.model.dart';

class AppState {
  UI ui;
  UploadedImage uploadedImage;
  List<FaceImage> faceImages;

  AppState({
    required this.ui,
    required this.uploadedImage,
    this.faceImages = const <FaceImage>[],
  });

  AppState.initialState()
      : ui = UI(),
        uploadedImage = UploadedImage(),
        faceImages = const <FaceImage>[];

  AppState copy({
    UI? ui,
    UploadedImage? uploadedImage,
    List<FaceImage>? faceImages,
  }) =>
      AppState(
        ui: ui ?? this.ui,
        uploadedImage: uploadedImage ?? this.uploadedImage,
        faceImages: faceImages ?? this.faceImages,
      );
}
