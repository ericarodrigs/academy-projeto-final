import 'dart:convert';

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rarovideowall/src/shared/constants/keys_storage.dart';
import 'package:rarovideowall/src/shared/interfaces/local_storage_service.dart';
import 'package:rarovideowall/src/shared/models/video_model.dart';

import '../mock_data.dart';
import 'local_storage_service_test.generate.mocks.dart';

@GenerateMocks([LocalStorageService])
class LocalStorageServiceStubs {
  final LocalStorageService _service = MockLocalStorageService();

  LocalStorageService get mock => _service;

  Map<String, String> _storage = {};

  Map<String, String> get storage => _storage;

  void registerStubs() {
    final encodedFirstVideo = jsonEncode(VideoModel.fromMap(firstVideo));
    when(_service.read(KeysStorage.email)).thenAnswer(
      (_) async => storage[KeysStorage.email],
    );
    when(_service.read(KeysStorage.password)).thenAnswer(
      (_) async => storage[KeysStorage.password],
    );
    when(_service.save(KeysStorage.email, 'testEmail')).thenAnswer(
      (_) async => _storage[KeysStorage.email] = 'testEmail',
    );
    when(_service.save(KeysStorage.password, 'testPassword')).thenAnswer(
      (_) async => _storage[KeysStorage.password] = 'testPassword',
    );
    when(_service.delete(KeysStorage.email)).thenAnswer(
      (_) async => _storage.remove(KeysStorage.email),
    );
    when(_service.delete(KeysStorage.password)).thenAnswer(
      (_) async => _storage.remove(KeysStorage.password),
    );
    when(_service.read(KeysStorage.history)).thenAnswer(
      (_) async => storage[KeysStorage.history],
    );
    when(_service.save(KeysStorage.history, encodedFirstVideo)).thenAnswer(
      (_) async => _storage[KeysStorage.history] = encodedFirstVideo,
    );
    when(_service.deleteAll()).thenAnswer(
      (_) async => _storage = {},
    );
  }
}
