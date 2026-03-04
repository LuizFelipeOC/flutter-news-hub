import 'package:flutter/foundation.dart';
import 'package:news_hub/app/data/repository/app_preferences/app_preferences_repository.dart';
import 'package:news_hub/app/pages/splash/splash_state.dart';

class SplashController extends ValueNotifier<SplashState> {
  final AppPreferencesRepository appPreferencesRepository;

  SplashController({required this.appPreferencesRepository}) : super(SplashInitialState());

  Future<void> checkFirstAccess() async {
    _changeFirstAccess(state: SplashLoadingState());

    final isFirstAccess = await appPreferencesRepository.isFirstAccess();

    _changeFirstAccess(state: SplashLoadedState(isFirstAccess: isFirstAccess));
  }

  void _changeFirstAccess({required SplashState state}) {
    value = state;
  }
}
