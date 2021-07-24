import 'dart:convert';

import 'package:http/http.dart' as http;

class BackendMessage {
  final String? code;
  final String message;
  final bool isError;
  final Map<String, dynamic>? responseObject;

  const BackendMessage({
    this.code,
    required this.message,
    required this.isError,
    this.responseObject,
  });

  static bool _isErrorFromStatusCode(int statusCode) {
    return statusCode < 200 || statusCode >= 300;
  }

  static bool _isErrorFromMessageCode(String code) {
    return code.split(':').first == 'ERR';
  }

  factory BackendMessage.fromResponse(http.Response response) {
    String? code;
    Map<String, dynamic>? responseObject;
    bool isError = _isErrorFromStatusCode(response.statusCode);
    String message = isError
        ? 'Unknown Error (${response.reasonPhrase})'
        : 'Request Succeeded (${response.reasonPhrase})';

    try {
      final dynamic responseDynamicObject = jsonDecode(response.body);

      if (responseDynamicObject is String) {
        message = responseDynamicObject;
      } else if (responseDynamicObject is Map) {
        responseObject = responseDynamicObject as Map<String, dynamic>;
        if (responseObject.containsKey('message')) {
          message = responseObject['message'].toString();
        }
        if (responseObject.containsKey('code')) {
          code = responseObject['code'].toString();
          isError = _isErrorFromMessageCode(code);
        }
      }
      // ignore: empty_catches
    } catch (e) {}

    return BackendMessage(
        code: code,
        message: message,
        isError: isError,
        responseObject: responseObject);
  }
}
