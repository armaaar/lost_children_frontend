import 'dart:typed_data';

import 'package:lost_children_frontend/store/uploadedImage/UploadedImage.model.dart';
import 'package:lost_children_frontend/store/uploadedImage/actions/UploadedImageAction.dart';

class SetUploadedImageAction extends UploadedImageAction {
  Uint8List markedImage;
  Map<String, int> facesHandlers;

  SetUploadedImageAction({
    required this.markedImage,
    required this.facesHandlers,
  });

  @override
  UploadedImage reduceState() => uploadedImage.copy(
        markedImage: markedImage,
        facesHandlers: facesHandlers,
      );
}
