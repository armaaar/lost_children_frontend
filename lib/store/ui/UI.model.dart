import 'package:lost_children_frontend/utils/NetworkInterface.dart';

class UI {
  bool loading;
  NetworkState? networkConnection;
  String? currentRoute;

  UI({
    this.loading = false,
    this.networkConnection,
    this.currentRoute,
  });

  UI copy({
    bool? loading,
    NetworkState? networkConnection,
    String? currentRoute,
  }) =>
      UI(
        loading: loading ?? this.loading,
        networkConnection: networkConnection ?? this.networkConnection,
        currentRoute: currentRoute ?? this.currentRoute,
      );
}
