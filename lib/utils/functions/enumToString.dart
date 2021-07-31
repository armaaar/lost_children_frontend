String? enumToString<T>(T enumValue) {
  return enumValue.toString().split('.')[1];
}
