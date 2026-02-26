import 'dart:convert';

import 'package:news_hub/app/core/network/network_exception.dart';
import 'package:news_hub/app/core/network/network_interface.dart';
import 'package:news_hub/app/core/network/network_result.dart';
import 'package:http/http.dart' as http;

class NetworkService implements NetworkInterface {
  final http.Client client = http.Client();

  @override
  Future<NetworkResult<T>> get<T>({required String url, Map<String, String>? parameters}) async {
    final apiResponse = await client.get(Uri.parse(url), headers: parameters);

    if (apiResponse.statusCode == 404) {
      return Failure(networkException: NotFoundException());
    }

    if (apiResponse.statusCode == 401) {
      return Failure(networkException: UnauthorizedNetworkException());
    }

    if (apiResponse.statusCode >= 500) {
      return Failure(networkException: ServerException());
    }

    try {
      final decodedData = jsonDecode(apiResponse.body) as T;
      return Success(data: decodedData);
    } catch (e) {
      return Failure(networkException: UnknownNetworkException(e.toString()));
    }
  }
}
