abstract class LocalStorageService {
  Future<bool> save(String key, String data);

  Future<String?> read(String key);

  Future<bool> delete(String key);
}
