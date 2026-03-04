import 'package:news_hub/app/data/datasources/local/local_storage_interface.dart';

class AppPreferencesRepository {
  final LocalStorageInterface localStorage;

  AppPreferencesRepository({required this.localStorage});

  Future<bool> isFirstAccess() async {
    final isFirstAccess = await localStorage.getData(key: 'isFirstAccess');

    if (isFirstAccess == null) {
      return false;
    }

    return isFirstAccess;
  }
}
