import 'dart:async';
import 'dart:io';
import 'package:async/async.dart' show StreamGroup;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:lost_children_frontend/settings/APISettings.dart';

enum NetworkState { connected, none }

Map<ConnectivityResult, NetworkState> _networkStateMap =
    <ConnectivityResult, NetworkState>{
  ConnectivityResult.wifi: NetworkState.connected,
  ConnectivityResult.mobile: NetworkState.connected,
  ConnectivityResult.none: NetworkState.none,
};

NetworkState? _lastConnectionState;

abstract class NetworkInterface {
  static final String url = APISettings.statusUrl;
  static const int testPeriod = 10;
  static const int timeout = 10;

  static NetworkState? get lastConnectionState => _lastConnectionState;

  static Future<NetworkState> checkNetworkState() async {
    return _connectivityToState(await Connectivity().checkConnectivity());
  }

  static Stream<NetworkState> onNetworkChange() async* {
    yield await checkNetworkState();
    yield* StreamGroup.merge<NetworkState>(<Stream<NetworkState>>[
      Connectivity()
          .onConnectivityChanged
          .asyncMap<NetworkState>(_connectivityToState),
      Stream<Future<NetworkState>>.periodic(
        const Duration(seconds: testPeriod),
        (_) => checkNetworkState(),
      ).asyncMap<NetworkState>((Future<NetworkState> event) async => event)
    ]);
  }

  static Future<NetworkState> _connectivityToState(
      ConnectivityResult result) async {
    final NetworkState state = _networkStateMap[result]!;
    if (state == NetworkState.none) {
      _lastConnectionState = NetworkState.none;
      return state;
    }
    return _testInternetConnection();
  }

  static Future<NetworkState> _testInternetConnection() async {
    try {
      await http.head(Uri.parse(url)).timeout(const Duration(seconds: timeout));
      _lastConnectionState = NetworkState.connected;
      return NetworkState.connected;
    } on TimeoutException catch (e) {
      debugPrint('Timeout Error: $e');
    } on SocketException catch (e) {
      debugPrint('Socket Error: $e');
    } catch (e) {
      debugPrint('General Error: $e');
    }

    _lastConnectionState = NetworkState.none;
    return NetworkState.none;
  }
}
