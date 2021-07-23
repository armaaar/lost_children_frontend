import 'dart:typed_data';

class UploadedImage {
  int? imageId;
  Uint8List? markedImage;
  Map<String, int>? facesHandlers;

  UploadedImage({
    this.imageId,
    this.markedImage,
    this.facesHandlers,
  });

  UploadedImage copy({
    int? imageId,
    Uint8List? markedImage,
    Map<String, int>? facesHandlers,
  }) =>
      UploadedImage(
        imageId: imageId ?? this.imageId,
        markedImage: markedImage ?? this.markedImage,
        facesHandlers: facesHandlers ?? this.facesHandlers,
      );

  bool get isEmpty {
    return imageId == null || markedImage == null || facesHandlers == null;
  }
}
