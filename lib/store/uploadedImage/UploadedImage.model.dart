import 'dart:typed_data';

enum UploadedImageState { lost, search }

class UploadedImage {
  int? imageId;
  Uint8List? markedImage;
  Map<String, int>? facesHandlers;
  UploadedImageState? imageState;

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
    UploadedImageState? imageState,
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
