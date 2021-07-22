import 'dart:typed_data';

class UploadedImage {
  Uint8List? markedImage;
  Map<String, int>? facesHandlers;

  UploadedImage({
    this.markedImage,
    this.facesHandlers,
  });

  UploadedImage copy({
    Uint8List? markedImage,
    Map<String, int>? facesHandlers,
  }) =>
      UploadedImage(
        markedImage: markedImage ?? this.markedImage,
        facesHandlers: facesHandlers ?? this.facesHandlers,
      );
}
