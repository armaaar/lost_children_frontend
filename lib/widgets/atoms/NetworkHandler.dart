import 'package:flutter/material.dart';
import 'package:lost_children_frontend/store/AppState.model.dart';
import 'package:lost_children_frontend/utils/NetworkInterface.dart';
import 'package:provider_for_redux/provider_for_redux.dart';

class NetworkHandler extends StatelessWidget {
  final Widget networkLoading;
  final Widget networkOff;
  final Widget networkOn;

  const NetworkHandler(
      {Key? key,
      this.networkLoading = const Text('Loading internet State'),
      this.networkOff = const Text('Internet is Off'),
      this.networkOn = const Text('Internet is On')})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReduxSelector<AppState, dynamic>(
        selector: (_, AppState state) => <dynamic>[state.ui.networkConnection],
        builder: (BuildContext context, _, AppState state, __, ___, ____) {
          debugPrint('Network::STATE ${state.ui.networkConnection}');
          if (state.ui.networkConnection == null) {
            return networkLoading;
          }

          if (state.ui.networkConnection == NetworkState.none) {
            return networkOff;
          }

          return networkOn;
        });
  }
}
