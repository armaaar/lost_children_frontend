import 'dart:typed_data';

import 'package:lost_children_frontend/interfaces/ImageState.dart';
import 'package:lost_children_frontend/store/uploadedImage/UploadedImage.model.dart';
import 'package:lost_children_frontend/store/uploadedImage/actions/UploadedImageAction.dart';

class SetUploadedImageAction extends UploadedImageAction {
  int imageId;
  Uint8List markedImage;
  Map<String, int> facesHandlers;
  ImageState imageState;

  SetUploadedImageAction({
    required this.imageId,
    required this.markedImage,
    required this.facesHandlers,
    required this.imageState,
  });

  @override
  UploadedImage reduceState() => uploadedImage.copy(
        imageId: imageId,
        markedImage: markedImage,
        facesHandlers: facesHandlers,
        imageState: imageState,
      );
}
