import 'dart:typed_data';

import 'package:lost_children_frontend/store/uploadedImage/UploadedImage.model.dart';
import 'package:lost_children_frontend/store/uploadedImage/actions/UploadedImageAction.dart';

class SetUploadedImageAction extends UploadedImageAction {
  int imageId;
  Uint8List markedImage;
  Map<String, int> facesHandlers;

  SetUploadedImageAction({
    required this.imageId,
    required this.markedImage,
    required this.facesHandlers,
  });

  @override
  UploadedImage reduceState() => uploadedImage.copy(
        imageId: imageId,
        markedImage: markedImage,
        facesHandlers: facesHandlers,
      );
}
