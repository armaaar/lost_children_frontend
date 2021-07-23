import 'dart:convert';

import 'package:http/http.dart' as http;

class BackendMessage {
  final String? code;
  final String message;
  final bool isError;

  const BackendMessage({
    this.code,
    required this.message,
    required this.isError,
  });

  static bool _isErrorFromStatusCode(int statusCode) {
    return statusCode < 200 || statusCode >= 300;
  }

  static bool _isErrorFromMessageCode(String code) {
    return code.split(':').first == 'ERR';
  }

  factory BackendMessage.fromResponse(http.Response response) {
    String? code;
    bool isError = _isErrorFromStatusCode(response.statusCode);
    String message = isError
        ? 'Unknown Error (${response.reasonPhrase})'
        : 'Request Succeeded (${response.reasonPhrase})';

    try {
      final dynamic responseObject = jsonDecode(response.body);

      if (responseObject is String) {
        message = responseObject;
      } else if (responseObject is Map) {
        if (responseObject.containsKey('message')) {
          message =
              (responseObject as Map<String, dynamic>)['message'].toString();
        }
        if (responseObject.containsKey('code')) {
          code = (responseObject as Map<String, dynamic>)['code'].toString();
          isError = _isErrorFromMessageCode(code);
        }
      }
      // ignore: empty_catches
    } catch (e) {}

    return BackendMessage(
      code: code,
      message: message,
      isError: isError,
    );
  }
}
