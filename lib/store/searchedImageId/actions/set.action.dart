import 'package:lost_children_frontend/store/searchedImageId/actions/SearchedImageIdAction.dart';

class SetSearchedImageIdAction extends SearchedImageIdAction {
  int newImageId;

  SetSearchedImageIdAction({
    required this.newImageId,
  });

  @override
  int reduceState() => newImageId;
}
