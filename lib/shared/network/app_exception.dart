class DioException implements Exception {
  final String message;

  DioException(this.message);

  @override
  String toString() => message;
}

class JsonFormException implements Exception {
  final String message;

  JsonFormException(this.message);

  @override
  String toString() => message;
}
