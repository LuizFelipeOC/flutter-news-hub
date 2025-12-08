abstract interface class IHttpClient {
  Future<String> get({required String path, Map<String, dynamic>? queryParameters});
}
