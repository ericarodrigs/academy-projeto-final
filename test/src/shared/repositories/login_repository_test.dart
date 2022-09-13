import 'package:flutter_test/flutter_test.dart';
import 'package:rarovideowall/src/shared/global_states/logged_state/logged_state.dart';
import 'package:rarovideowall/src/shared/interfaces/login_repository_interface.dart';
import 'package:rarovideowall/src/shared/repositories/login_repository.dart';

import '../../../mocks/api_service_test/api_service_test.generate.dart';
import '../../../mocks/local_storage_service_test/local_storage_service_test.generate.dart';

void main() {
  late ILoginRepository loginRepository;
  setUpAll(() {
    final apiStubs = ApiServiceStubs();
    final localStorageStubs = LocalStorageServiceStubs();
    loginRepository = LoginRepository(
      apiService: apiStubs.mock,
      localStorageService: localStorageStubs.mock,
      loggedState: LoggedState.instance,
    );
    apiStubs.registerStubs();
    localStorageStubs.registerStubs();
  });
  group('Test LoginRepository', () {
    test('', () {});
  });
}
