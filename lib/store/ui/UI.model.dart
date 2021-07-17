class UI {
  bool loading;

  UI({this.loading = false});

  UI copy({bool? loading}) => UI(loading: loading ?? this.loading);
}
