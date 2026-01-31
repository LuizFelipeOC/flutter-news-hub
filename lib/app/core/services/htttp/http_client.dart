import 'dart:io';

import 'package:news_hub/app/core/constants/constants.dart';
import 'package:news_hub/app/core/services/htttp/http_client_interface.dart';
import 'package:http/http.dart' as http;
import 'package:news_hub/app/core/services/htttp/http_errors.dart';

class HttpClient implements IHttpClient {
  final String baseUrl = Constants.baseURL;

  final _client = http.Client();

  @override
  Future<String> get({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _client.get(
        Uri.parse('$baseUrl$path').replace(queryParameters: queryParameters),
      );

      if (response.statusCode < 200 || response.statusCode >= 300) {
        throw UnknownHttpError(
          message: 'Failed to load data: ${response.reasonPhrase}',
        );
      }

      if (response.statusCode == 404) {
        throw NotFoundHttpError(message: 'Resource not found at $path');
      }

      if (response.statusCode == 503) {
        throw CustomSocketException(
          message: 'Service unavailable. Please try again later.',
        );
      }

      print(response.request);

      return response.body;
    } on SocketException catch (socketError) {
      throw CustomSocketException(message: socketError.message);
    } on UnknownHttpError catch (unknownError) {
      throw UnknownHttpError(
        message:
            'Occurred an unknown error on connection to the server: ${unknownError.message}',
      );
    }
  }
}
