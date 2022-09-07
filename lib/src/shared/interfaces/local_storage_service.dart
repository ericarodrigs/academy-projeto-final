abstract class LocalStorageService {
  Future<void> save(String key, String data);

  Future<String?> read(String key);

  Future<void> delete(String key);
}
