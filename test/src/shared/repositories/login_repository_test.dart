import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rarovideowall/src/modules/login_module/features/login/model/login_user_model.dart';
import 'package:rarovideowall/src/modules/login_module/features/recover_password/model/recover_password_model.dart';
import 'package:rarovideowall/src/modules/login_module/features/recover_password/model/request_code_model.dart';
import 'package:rarovideowall/src/modules/login_module/features/register/model/register_user_model.dart';
import 'package:rarovideowall/src/shared/global_states/logged_state/logged_state.dart';
import 'package:rarovideowall/src/shared/interfaces/login_repository_interface.dart';
import 'package:rarovideowall/src/shared/models/user_model.dart';
import 'package:rarovideowall/src/shared/repositories/login_repository.dart';

import '../../../mocks/api_service_test/api_service_test.generate.dart';
import '../../../mocks/local_storage_service_test/local_storage_service_test.generate.dart';
import '../../../mocks/mock_data.dart';

void main() {
  late ILoginRepository loginRepository;
  late LocalStorageServiceStubs localStorageStubs;
  setUpAll(() {
    final apiStubs = ApiServiceStubs();
    localStorageStubs = LocalStorageServiceStubs();
    loginRepository = LoginRepository(
      apiService: apiStubs.mock,
      localStorageService: localStorageStubs.mock,
      loggedState: LoggedState.instance,
    );
    apiStubs.registerStubs();
    localStorageStubs.registerStubs();
  });
  group('Test LoginRepository:', () {
    test(
        'Should return a UserModel with authLogin information when login is called with (email: test, password: test)',
        () async {
      (await loginRepository
              .login(LoginUserModel(email: 'test', password: 'test')))
          .fold(
        (l) => expect(l, null),
        (user) => expect(user, UserModel.fromMap(authLogin)),
      );
    });
    test('After login loggedState.isLogged should be true', () {
      expect(LoggedState.instance.isLogged, true);
    });
    test('Should return a Right null when register is called with success',
        () async {
      bool isSuccess = false;
      (await loginRepository.register(
        RegisterUserModel(
          accessCode: '55402f9b-ca01-4cb4-ae36-dc85d7e154b8',
          email: 'test',
          name: 'test',
          password: 'test',
        ),
      ))
          .fold(
        (l) => expect(l, null),
        (success) => isSuccess = true,
      );
      expect(isSuccess, true);
    });
    test('Should return a Right null when requestCode is called with success',
        () async {
      bool isSuccess = false;
      (await loginRepository.requestCode(RequestCodeModel(email: 'test'))).fold(
        (l) => expect(l, null),
        (success) => isSuccess = true,
      );
      expect(isSuccess, true);
    });

    test(
        'Should return a Right null when updatePassword is called with success',
        () async {
      bool isSuccess = false;
      (await loginRepository.updatePassword(RecoverPasswordModel(
        code: '12345',
        newPassword: 'test2',
      )))
          .fold(
        (l) => expect(l, null),
        (success) => isSuccess = true,
      );
      expect(isSuccess, true);
    });
    test(
        'Should loggedState.isLogged be false and local storage empty when logout action occurs',
        () async {
      loginRepository.logout();
      expect(LoggedState.instance.isLogged, false);
      expect(localStorageStubs.storage, {});
    });
  });
}
