sealed class NetworkException implements Exception {
  final String message;

  const NetworkException(this.message);
}

class TimeoutNetworkException extends NetworkException {
  const TimeoutNetworkException()
    : super('A requisição demorou muito para ser concluída, tente novamente mais tarde');
}

class UnauthorizedNetworkException extends NetworkException {
  const UnauthorizedNetworkException() : super('O acesso a este recurso requer autenticação');
}

class NotFoundException extends NetworkException {
  const NotFoundException() : super('As informações solicitadas não foram encontradas');
}

class ServerException extends NetworkException {
  const ServerException() : super('Ocorreu um erro no servidor, tente novamente mais tarde');
}

class UnknownNetworkException extends NetworkException {
  const UnknownNetworkException(super.message);
}
