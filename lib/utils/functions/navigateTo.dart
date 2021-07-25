import 'package:flutter/cupertino.dart';
import 'package:lost_children_frontend/store/ui/actions/route.action.dart';
import 'package:lost_children_frontend/utils/GlobalRedux.dart';

bool isCurrentRoute(String routeName) =>
    GlobalRedux.state.ui.currentRoute == routeName;

Future<bool> navigateTo(BuildContext context, String routeName) async {
  if (isCurrentRoute(routeName)) return false;
  GlobalRedux.dispatch(SetCurrentRouteAction(routeName));
  await Navigator.pushReplacementNamed(context, routeName);
  return true;
}
