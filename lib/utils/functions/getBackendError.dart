import 'dart:convert';
import 'package:http/http.dart' as http;

String getBackendError(http.Response response) {
  String errorMessage = 'Unknown Error (${response.reasonPhrase})';

  try {
    final dynamic responseObject = jsonDecode(response.body);

    if (responseObject is String) {
      errorMessage = responseObject;
    } else if (responseObject is Map && responseObject.containsKey('message')) {
      errorMessage =
          (responseObject as Map<String, dynamic>)['message'].toString();
    }
    // ignore: empty_catches
  } catch (e) {}

  return 'Error: $errorMessage';
}
