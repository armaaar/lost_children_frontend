import 'dart:typed_data';

import 'package:lost_children_frontend/interfaces/ImageState.dart';

class UploadedImage {
  int? imageId;
  Uint8List? markedImage;
  Map<String, int>? facesHandlers;
  ImageState? imageState;

  UploadedImage({
    this.imageId,
    this.markedImage,
    this.facesHandlers,
    this.imageState,
  });

  UploadedImage copy({
    int? imageId,
    Uint8List? markedImage,
    Map<String, int>? facesHandlers,
    ImageState? imageState,
  }) =>
      UploadedImage(
        imageId: imageId ?? this.imageId,
        markedImage: markedImage ?? this.markedImage,
        facesHandlers: facesHandlers ?? this.facesHandlers,
        imageState: imageState ?? this.imageState,
      );

  bool get isEmpty {
    return imageId == null ||
        markedImage == null ||
        facesHandlers == null ||
        imageState == null;
  }
}
