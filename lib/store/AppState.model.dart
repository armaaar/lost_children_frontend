import 'package:lost_children_frontend/store/ui/UI.model.dart';
import 'package:lost_children_frontend/store/uploadedImage/UploadedImage.model.dart';

class AppState {
  UI ui;
  UploadedImage uploadedImage;

  AppState({
    required this.ui,
    required this.uploadedImage,
  });

  AppState.initialState()
      : ui = UI(),
        uploadedImage = UploadedImage();

  AppState copy({
    UI? ui,
    UploadedImage? uploadedImage,
  }) =>
      AppState(
        ui: ui ?? this.ui,
        uploadedImage: uploadedImage ?? this.uploadedImage,
      );
}
