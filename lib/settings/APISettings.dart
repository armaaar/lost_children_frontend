import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lost_children_frontend/interfaces/RequestEndPoint.dart';

abstract class APISettings {
  static final String url = dotenv.env['API_URL']!;

  static final String mediaUrl = '$url/media/';

  static final RequestEndPoint status = RequestEndPoint(
    url: '$url/health/',
    method: RequestMethod.head,
  );
  static final RequestEndPoint detect = RequestEndPoint(
    url: '$url/faces/detect/',
    method: RequestMethod.post,
  );
  static final RequestEndPoint select = RequestEndPoint(
    url: '$url/faces/select/',
    method: RequestMethod.patch,
  );
  static final RequestEndPoint lostImages = RequestEndPoint(
    url: '$url/faces/lost/',
    method: RequestMethod.get,
  );
}
