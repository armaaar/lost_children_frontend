import 'package:async_redux/async_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:lost_children_frontend/store/AppState.model.dart';
import 'package:provider/provider.dart';

typedef DispatchFunction = void Function(ReduxAction<AppState>, {bool notify});
typedef DispatchFutureFunction = Future<void> Function(ReduxAction<AppState>,
    {bool notify});

Store<AppState> _store = Store<AppState>(
  initialState: AppState.initialState(),
);

abstract class GlobalRedux {
  static Store<AppState> get store => _store;

  static AppState get state => _store.state;

  static DispatchFunction get dispatch => _store.dispatch;

  static DispatchFutureFunction get dispatchFuture => _store.dispatchFuture;

  static Store<AppState> consumeStore(BuildContext context) =>
      Provider.of<Store<AppState>>(context, listen: false);

  static AppState consumeState(BuildContext context) =>
      Provider.of<AppState>(context, listen: false);

  static DispatchFunction consumeDispatch(BuildContext context) =>
      Provider.of<Dispatch>(context, listen: false);

  static DispatchFutureFunction consumeDispatchFuture(BuildContext context) =>
      Provider.of<DispatchFuture>(context, listen: false);
}
