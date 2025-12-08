abstract interface class IHttpErrors implements Exception {
  String get message;
  int get statusCode;

  @override
  String toString() => 'HttpError: $message (Status Code: $statusCode)';
}

class CustomSocketException implements IHttpErrors {
  @override
  final String message;

  @override
  int get statusCode => 503;

  CustomSocketException({required this.message});
}

class UnknownHttpError implements IHttpErrors {
  @override
  final String message;

  @override
  int get statusCode => 500;

  UnknownHttpError({required this.message});
}

class NotFoundHttpError implements IHttpErrors {
  @override
  final String message;

  @override
  int get statusCode => 404;

  NotFoundHttpError({required this.message});
}
