import 'package:news_hub/app/core/network/network_result.dart';

abstract interface class NetworkInterface {
  Future<NetworkResult<T>> get<T>({required String url, Map<String, String>? parameters});
}
