import 'package:lost_children_frontend/utils/NetworkInterface.dart';

class UI {
  bool loading;
  NetworkState? networkConnection;

  UI({
    this.loading = false,
    this.networkConnection,
  });

  UI copy({
    bool? loading,
    NetworkState? networkConnection,
  }) =>
      UI(
        loading: loading ?? this.loading,
        networkConnection: networkConnection ?? this.networkConnection,
      );
}
