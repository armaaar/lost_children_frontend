import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:lost_children_frontend/settings/ThemeSettings.dart';
import 'package:lost_children_frontend/widgets/atoms/NetworkHandler.dart';

class NetworkOnHandler extends StatelessWidget {
  final Widget child;

  const NetworkOnHandler({
    Key? key,
    this.child = const Text('Internet is On'),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NetworkHandler(
        networkLoading: LoadingOverlay(
          isLoading: true,
          child: const SizedBox(),
        ),
        networkOff: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              Icon(Icons.public_off, size: ThemeSettings.iconSizeLarge),
              SizedBox(height: ThemeSettings.spaceSection),
              Text('Cannot connect to the server'),
            ],
          ),
        ),
        networkOn: child);
  }
}
