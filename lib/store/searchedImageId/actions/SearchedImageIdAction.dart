import 'package:async_redux/async_redux.dart';
import 'package:lost_children_frontend/store/AppState.model.dart';

abstract class SearchedImageIdAction extends ReduxAction<AppState> {
  int get searchedImageId => state.searchedImageId;

  int reduceState();

  @override
  AppState reduce() {
    return state.copy(searchedImageId: reduceState());
  }
}
