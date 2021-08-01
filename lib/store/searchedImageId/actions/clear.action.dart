import 'package:lost_children_frontend/store/searchedImageId/actions/SearchedImageIdAction.dart';

class ClearSearchedImageIdAction extends SearchedImageIdAction {
  @override
  int reduceState() => 0;
}
