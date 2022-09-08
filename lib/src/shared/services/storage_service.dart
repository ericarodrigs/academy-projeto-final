import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rarovideowall/src/shared/interfaces/local_storage_service.dart';

class StorageService implements LocalStorageService {

  StorageService._();

  static final StorageService _instance = StorageService._();

  static StorageService get instance => _instance;

  final storage = const FlutterSecureStorage();

  @override
  Future<String?> read(String key) async {
   return await storage.read(key: key, aOptions: _getAndroidOptions());
  }

  @override
  Future<void> save(String key, String value) async {
    await storage.write(key: key, value: value,  aOptions: _getAndroidOptions());
  }

  @override
  Future<void> deleteAll() async {
    await storage.deleteAll(aOptions: _getAndroidOptions());
  }

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
    encryptedSharedPreferences: true,
  );

}
