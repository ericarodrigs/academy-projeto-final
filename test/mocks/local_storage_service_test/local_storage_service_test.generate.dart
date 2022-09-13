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
    when(_service.read(KeysStorage.email)).thenAnswer(
      (_) async => storage[KeysStorage.email],
    );
    when(_service.read(KeysStorage.password)).thenAnswer(
      (_) async => storage[KeysStorage.password],
    );
    when(_service.save(KeysStorage.email, 'testEmail')).thenAnswer(
      (_) async => _storage[KeysStorage.email] = 'testEmail',
    );
    when(_service.save(KeysStorage.history, 'testEmail')).thenAnswer(
      (_) async => _storage[KeysStorage.history] = 'testEmail',
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
    when(_service.save(
      KeysStorage.history,
      '"{\\"id\\":\\"84962753-5a59-4c0b-a9c0-9fe377880489\\",\\"nome\\":\\"Por que aprender .net?\\",\\"url\\":\\"https://www.youtube.com/watch?v=xnXE4rIIRqw&t=1899s\\",\\"thumbUrl\\":\\"https://thumbs.dreamstime.com/b/quality-assurance-service-guarantee-standard-internet-business-technology-concept-123053344.jpg\\",\\"descricao\\":\\"Vamos falar sobre o mercado atual de .net, e o quanto queremos vc para trabalhar conosco\\",\\"createdAt\\":\\"2022-08-19T12:15:42.334Z\\",\\"duracao\\":\\"1:05\\",\\"dataPublicacao\\":\\"2022-08-19T14:10:24.000Z\\",\\"topico\\":\\".net\\",\\"tags\\":[\\".net\\",\\"aulão\\",\\"professora Stella\\",\\"professora Pedro\\"]}"',
    )).thenAnswer(
      (_) async => _storage[KeysStorage.history] =
          '"{\\"id\\":\\"84962753-5a59-4c0b-a9c0-9fe377880489\\",\\"nome\\":\\"Por que aprender .net?\\",\\"url\\":\\"https://www.youtube.com/watch?v=xnXE4rIIRqw&t=1899s\\",\\"thumbUrl\\":\\"https://thumbs.dreamstime.com/b/quality-assurance-service-guarantee-standard-internet-business-technology-concept-123053344.jpg\\",\\"descricao\\":\\"Vamos falar sobre o mercado atual de .net, e o quanto queremos vc para trabalhar conosco\\",\\"createdAt\\":\\"2022-08-19T12:15:42.334Z\\",\\"duracao\\":\\"1:05\\",\\"dataPublicacao\\":\\"2022-08-19T14:10:24.000Z\\",\\"topico\\":\\".net\\",\\"tags\\":[\\".net\\",\\"aulão\\",\\"professora Stella\\",\\"professora Pedro\\"]}"',
    );
    when(_service.deleteAll()).thenAnswer(
      (_) async => _storage = {},
    );
  }
}
