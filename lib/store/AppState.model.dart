import 'package:lost_children_frontend/store/faceImage/FaceImage.model.dart';
import 'package:lost_children_frontend/store/ui/UI.model.dart';
import 'package:lost_children_frontend/store/uploadedImage/UploadedImage.model.dart';

class AppState {
  UI ui;
  UploadedImage uploadedImage;
  List<FaceImage> faceImages;
  int searchedImageId;

  AppState({
    required this.ui,
    required this.uploadedImage,
    this.faceImages = const <FaceImage>[],
    this.searchedImageId = 0,
  });

  AppState.initialState()
      : ui = UI(),
        uploadedImage = UploadedImage(),
        faceImages = const <FaceImage>[],
        searchedImageId = 0;

  AppState copy({
    UI? ui,
    UploadedImage? uploadedImage,
    List<FaceImage>? faceImages,
    int? searchedImageId,
  }) =>
      AppState(
        ui: ui ?? this.ui,
        uploadedImage: uploadedImage ?? this.uploadedImage,
        faceImages: faceImages ?? this.faceImages,
        searchedImageId: searchedImageId ?? this.searchedImageId,
      );
}
