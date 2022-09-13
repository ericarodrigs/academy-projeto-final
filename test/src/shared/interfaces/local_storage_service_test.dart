import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:rarovideowall/src/shared/constants/keys_storage.dart';
import 'package:rarovideowall/src/shared/interfaces/local_storage_service.dart';
import 'package:rarovideowall/src/shared/models/video_model.dart';

import '../../../mocks/local_storage_service_test/local_storage_service_test.generate.dart';
import '../../../mocks/mock_data.dart';

void main() {
  late LocalStorageService service;
  late LocalStorageServiceStubs stubs;
  setUp(() {
    stubs = LocalStorageServiceStubs();
    service = stubs.mock;
    stubs.registerStubs();
  });
  group('local storage service tests', () {
    test(
        'Should storage contain the email when save the key ${KeysStorage.email}',
        () async {
      await service.save(KeysStorage.email, 'testEmail');
      expect(stubs.storage[KeysStorage.email], 'testEmail');
    });
    test(
        'Should storage contain the password when save the key ${KeysStorage.password}',
        () async {
      await service.save(KeysStorage.password, 'testPassword');
      expect(stubs.storage[KeysStorage.password], 'testPassword');
    });
    test(
        'Should storage contain the firstVideo when save the key ${KeysStorage.history}',
        () async {
      await service.save(
          KeysStorage.history, jsonEncode(VideoModel.fromMap(firstVideo)));
      expect(stubs.storage[KeysStorage.history],
          jsonEncode(VideoModel.fromMap(firstVideo)));
    });
    test('Should return null when read a key not stored', () async {
      var response = await service.read(KeysStorage.password);
      expect(response, null);
      response = await service.read(KeysStorage.email);
      expect(response, null);
    });
    test('Should return the value stored when read a key stored', () async {
      await service.save(KeysStorage.password, 'testPassword');
      var response = await service.read(KeysStorage.password);
      expect(response, 'testPassword');
      await service.save(KeysStorage.email, 'testEmail');
      response = await service.read(KeysStorage.email);
      expect(response, 'testEmail');
    });
    test('Should return null when a key stored is deleted', () async {
      await service.save(KeysStorage.password, 'testPassword');
      await service.delete(KeysStorage.password);
      var response = await service.read(KeysStorage.password);
      expect(response, null);
      await service.save(KeysStorage.email, 'testEmail');
      await service.delete(KeysStorage.email);
      response = await service.read(KeysStorage.email);
      expect(response, null);
    });
    test('Should return null when all key stored are deleted', () async {
      await service.save(KeysStorage.password, 'testPassword');
      await service.save(KeysStorage.email, 'testEmail');
      await service.deleteAll();
      var response = await service.read(KeysStorage.password);
      expect(response, null);
      response = await service.read(KeysStorage.email);
      expect(response, null);
    });
  });
}
