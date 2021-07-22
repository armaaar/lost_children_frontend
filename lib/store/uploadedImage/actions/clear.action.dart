import 'package:lost_children_frontend/store/uploadedImage/UploadedImage.model.dart';
import 'package:lost_children_frontend/store/uploadedImage/actions/UploadedImageAction.dart';

class ClearUploadedImageAction extends UploadedImageAction {
  @override
  UploadedImage reduceState() => UploadedImage();
}
