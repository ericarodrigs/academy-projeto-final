import 'package:rarovideowall/src/shared/interfaces/local_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService implements LocalStorageService {
  SharedPreferencesService._();

  static final SharedPreferencesService _instance =
      SharedPreferencesService._();

  static SharedPreferencesService get instance => _instance;

  @override
  Future<bool> delete(String key) async {
    final service = await SharedPreferences.getInstance();
    return await service.remove(key);
  }

  @override
  Future<String?> read(String key) async {
    final service = await SharedPreferences.getInstance();
    return service.getString(key);
  }

  @override
  Future<bool> save(String key, String data) async {
    final service = await SharedPreferences.getInstance();
    return await service.setString(key, data);
  }
}
