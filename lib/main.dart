import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:lost_children_frontend/settings/ThemeSettings.dart';
import 'package:lost_children_frontend/store/AppState.model.dart';
import 'package:lost_children_frontend/store/ui/actions/networkConnection.action.dart';
import 'package:lost_children_frontend/utils/GlobalRedux.dart';
import 'package:lost_children_frontend/utils/NetworkInterface.dart';
import 'package:lost_children_frontend/widgets/pages/HomePage.dart';
import 'package:provider_for_redux/provider_for_redux.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  // Load environment variables
  await dotenv.load(fileName: '.env');

  //Subscribe to network updates
  NetworkInterface.onNetworkChange().listen((NetworkState newNetworkState) =>
      GlobalRedux.dispatch(UpdateNetworkConnectionAction(newNetworkState)));

  // Run flutter app
  runApp(MainApp(
    store: GlobalRedux.store,
  ));
}

class MainApp extends StatelessWidget {
  final Store<AppState> store;

  const MainApp({
    Key? key,
    required this.store,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AsyncReduxProvider<AppState>.value(
      value: store,
      child: MaterialApp(
        title: 'Lost Children',
        theme: ThemeData(
            primarySwatch: ThemeSettings.colorSwatch,
            textTheme: const TextTheme(
                bodyText2: TextStyle(
                    letterSpacing: 0.5,
                    color: ThemeSettings.colorText,
                    fontSize: ThemeSettings.fontSizeNormal))),
        initialRoute: HomePage.route,
        routes: <String, Widget Function(BuildContext)>{
          HomePage.route: (BuildContext context) => const HomePage(),
        },
      ),
    );
  }
}
