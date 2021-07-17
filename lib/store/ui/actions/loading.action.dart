import 'package:lost_children_frontend/store/ui/UI.model.dart';
import 'package:lost_children_frontend/store/ui/actions/UIAction.dart';

class EnableLoadingAction extends UIAction {
  @override
  UI reduceState() => ui.copy(loading: true);
}

class DisableLoadingAction extends UIAction {
  @override
  UI reduceState() => ui.copy(loading: false);
}
