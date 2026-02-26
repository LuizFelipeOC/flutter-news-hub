import 'package:news_hub/app/core/network/network_exception.dart';

sealed class NetworkResult<T> {
  const NetworkResult();
}

class Success<T> extends NetworkResult<T> {
  final T data;

  const Success({required this.data});
}

class Failure<T> extends NetworkResult<T> {
  final NetworkException networkException;
  final T? data;

  const Failure({required this.networkException, this.data});
}
