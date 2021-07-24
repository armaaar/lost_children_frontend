import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:lost_children_frontend/settings/ThemeSettings.dart';
import 'package:lost_children_frontend/store/AppState.model.dart';
import 'package:lost_children_frontend/widgets/molecules/NetworkOnHandler.dart';
import 'package:provider_for_redux/provider_for_redux.dart';

class StandardBodyContainer extends StatelessWidget {
  final Widget body;

  const StandardBodyContainer({
    Key? key,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReduxSelector<AppState, dynamic>(
        selector: (_, AppState state) => <dynamic>[state.ui],
        builder: (BuildContext context, _, AppState state, __, ___, ____) {
          return SafeArea(
            child: LoadingOverlay(
              isLoading: state.ui.loading,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.all(ThemeSettings.spaceSection),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    constraints: const BoxConstraints(
                      maxWidth: ThemeSettings.screenMaxWidth,
                    ),
                    child: NetworkOnHandler(
                      child: body,
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
