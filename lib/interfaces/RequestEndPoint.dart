enum RequestMethod { get, post, put, delete, patch, head }

class RequestEndPoint {
  final String url;
  final RequestMethod method;

  const RequestEndPoint({
    required this.url,
    required this.method,
  });
}
