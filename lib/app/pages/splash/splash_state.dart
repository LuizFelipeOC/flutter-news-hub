abstract interface class SplashState {}

class SplashInitialState implements SplashState {}

class SplashLoadingState implements SplashState {}

class SplashLoadedState implements SplashState {
  final bool isFirstAccess;

  SplashLoadedState({required this.isFirstAccess});
}
