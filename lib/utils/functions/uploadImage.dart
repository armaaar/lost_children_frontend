import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

Future<http.Response> uploadImage(
  String url,
  XFile image,
  Map<String, dynamic> fields,
) async {
  return http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json'
    },
    body: jsonEncode(<String, dynamic>{
      ...fields,
      'image': base64Encode(await image.readAsBytes()),
    }),
  );
}
