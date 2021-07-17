import 'package:async_redux/async_redux.dart';
import 'package:lost_children_frontend/store/AppState.model.dart';
import 'package:lost_children_frontend/store/ui/UI.model.dart';

abstract class UIAction extends ReduxAction<AppState> {
  UI get ui => state.ui;
  UI reduceState();

  @override
  AppState reduce() {
    return state.copy(ui: reduceState());
  }
}
