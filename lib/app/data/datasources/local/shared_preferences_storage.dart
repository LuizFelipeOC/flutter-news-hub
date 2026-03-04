import 'package:news_hub/app/data/datasources/local/local_storage_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesStorage implements LocalStorageInterface {
  @override
  Future<dynamic> getData({required String key}) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    if (key.isEmpty) {
      throw ArgumentError('Key cannot be empty');
    }

    return preferences.get(key);
  }

  @override
  Future<void> saveData({required String key, required dynamic value}) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    if (key.isEmpty) {
      throw ArgumentError('Key cannot be empty');
    }

    if (value == null) {
      throw ArgumentError('Value cannot be null');
    }

    if (value is bool) {
      await preferences.setBool(key, value);
    }
  }
}
