import 'package:lost_children_frontend/store/ui/UI.model.dart';
import 'package:lost_children_frontend/store/ui/actions/UIAction.dart';
import 'package:lost_children_frontend/utils/NetworkInterface.dart';

class UpdateNetworkConnectionAction extends UIAction {
  final NetworkState? newNetworkConnection;

  UpdateNetworkConnectionAction(this.newNetworkConnection);

  @override
  UI reduceState() => ui.copy(networkConnection: newNetworkConnection);
}
