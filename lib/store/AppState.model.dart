import 'package:lost_children_frontend/store/ui/UI.model.dart';

class AppState {
  UI ui;

  AppState({
    required this.ui,
  });

  AppState.initialState() : ui = UI();

  AppState copy({UI? ui}) => AppState(ui: ui ?? this.ui);
}
