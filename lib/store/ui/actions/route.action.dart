import 'package:lost_children_frontend/store/ui/UI.model.dart';
import 'package:lost_children_frontend/store/ui/actions/UIAction.dart';

class SetCurrentRouteAction extends UIAction {
  final String newRoute;

  SetCurrentRouteAction(this.newRoute);

  @override
  UI reduceState() => ui.copy(currentRoute: newRoute);
}
