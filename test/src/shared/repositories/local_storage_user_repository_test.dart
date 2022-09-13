import 'package:flutter_test/flutter_test.dart';
import 'package:rarovideowall/src/modules/login_module/features/login/model/login_user_model.dart';
import 'package:rarovideowall/src/shared/constants/keys_storage.dart';
import 'package:rarovideowall/src/shared/interfaces/local_storage_user_repository_interface.dart';
import 'package:rarovideowall/src/shared/repositories/local_storage_user_repository.dart';

import '../../../mocks/local_storage_service_test/local_storage_service_test.generate.dart';

void main() {
  late ILocalStorageUserRepository storageRepository;
  late LocalStorageServiceStubs storageStubs;
  setUpAll(() {
    storageStubs = LocalStorageServiceStubs();

    storageStubs.registerStubs();
    storageRepository = LocalStorageUserRepository(
      service: storageStubs.mock,
    );
  });

  group('Test localStorageUserRepository:', () {
    test(
        'Should return Failure when get is called without to save user information.',
        () async {
      (await storageRepository.get()).fold(
        (fail) => expect(fail.message, 'Usuário não encontrado.'),
        (r) => expect(r, null),
      );
    });
    test(
        'Should the storage on KeysStorage email and password be testEmail and testPassword when save is called.',
        () async {
      (await storageRepository.save(LoginUserModel(
        email: 'testEmail',
        password: 'testPassword',
      )))
          .fold(
        (l) => expect(l, null),
        (r) => null,
      );
      expect(storageStubs.storage[KeysStorage.email], 'testEmail');
      expect(storageStubs.storage[KeysStorage.password], 'testPassword');
    });
    test(
        'Should return LoginUserModel when get is called with user information saved.',
        () async {
      (await storageRepository.get()).fold(
        (l) => expect(l, null),
        (user) => expect(
          user,
          LoginUserModel(
            email: 'testEmail',
            password: 'testPassword',
          ),
        ),
      );
    });
  });
}
