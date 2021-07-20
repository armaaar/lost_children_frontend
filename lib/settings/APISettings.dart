import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class APISettings {
  static final String url = dotenv.env['API_URL']!;
  static final String detectUrl = '$url/faces/detect/';
  static final String statusUrl = '$url/health/';
}
