class HttpResult {
  int statusCode;
  bool isSuccess;
  dynamic result;

  HttpResult({
    required this.statusCode,
    required this.isSuccess,
    required this.result,
  });
}