abstract interface class LocalStorageInterface {
  Future<void> saveData({required String key, required dynamic value});
  Future<dynamic> getData({required String key});
}
