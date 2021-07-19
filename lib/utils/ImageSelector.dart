import 'package:image_picker/image_picker.dart';
import 'package:lost_children_frontend/settings/ImageSettings.dart';

class ImageSelector {
  // Singleton pattern
  static final ImageSelector _singleton = ImageSelector._privateConstructor();

  factory ImageSelector() {
    return _singleton;
  }

  ImageSelector._privateConstructor();

  // Class
  final ImagePicker _picker = ImagePicker();
  dynamic pickImageError;
  String? retrieveDataError;

  Future<XFile?> _pickImage(ImageSource imageSource) async {
    try {
      return await _picker.pickImage(
        source: imageSource,
        maxWidth: ImageSettings.maxDimension,
        maxHeight: ImageSettings.maxDimension,
        imageQuality: ImageSettings.quality,
      );
    } catch (e) {
      pickImageError = e;
    }
    return null;
  }

  Future<XFile?> selectImage() async {
    return _pickImage(ImageSource.gallery);
  }

  Future<XFile?> captureImage() async {
    return _pickImage(ImageSource.camera);
  }

  // only for android
  Future<XFile?> retrieveLostData() async {
    final LostDataResponse response = await _picker.retrieveLostData();
    if (response.isEmpty) {
      return null;
    }
    if (response.file != null) {
      return response.file;
    } else {
      retrieveDataError = response.exception!.code;
    }
  }
}
