import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lost_children_frontend/interfaces/RequestEndPoint.dart';

typedef _GetHTTPRequest = Future<http.Response> Function(Uri url,
    {Map<String, String>? headers});

typedef _PostHTTPRequest = Future<http.Response> Function(Uri url,
    {Map<String, String>? headers, Object? body, Encoding? encoding});

const Map<RequestMethod, _GetHTTPRequest> _getRequestMethodToHTTP =
    <RequestMethod, _GetHTTPRequest>{
  RequestMethod.head: http.head,
  RequestMethod.get: http.get,
};

const Map<RequestMethod, _PostHTTPRequest> _postRequestMethodToHTTP =
    <RequestMethod, _PostHTTPRequest>{
  RequestMethod.post: http.post,
  RequestMethod.put: http.put,
  RequestMethod.patch: http.patch,
};

Future<http.Response> sendRequest(
  RequestEndPoint request, {
  Map<String, dynamic>? fields,
}) async {
  if (_getRequestMethodToHTTP.containsKey(request.method)) {
    return _getRequestMethodToHTTP[request.method]!(
      Uri.parse(request.url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json'
      },
    );
  }
  return _postRequestMethodToHTTP[request.method]!(
    Uri.parse(request.url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json'
    },
    body: jsonEncode(fields),
  );
}
