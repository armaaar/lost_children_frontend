T? enumFromString<T>(List<T?> values, String value) {
  try {
    return values.firstWhere((T? v) => v.toString().split('.')[1] == value);
  } on StateError catch (_) {
    return null;
  }
}
