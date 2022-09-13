import 'package:flutter_test/flutter_test.dart';
import 'package:rarovideowall/src/shared/global_states/logged_state/logged_state.dart';
import 'package:rarovideowall/src/shared/models/user_model.dart';

void main() {
  late LoggedState state;
  setUpAll(() {
    state = LoggedState.instance;
  });

  final UserModel userModel = UserModel(
      accessToken: '0011ff',
      name: 'Jose',
      admin: false,
      photo: 'url',
      id: '11111');

  group('testing the methods setLogin, and setLogout.', () {
    test('Should isLogged be true and user != null when setLogin is called.',
        () {
      state.setLogin(userModel);
      expect(state.isLogged, true);
      expect(state.user, isInstanceOf<UserModel>());
    });

    test('Should isLogged be false and user == null when setLogout is called.',
        () {
      state.setLogout();
      expect(state.isLogged, false);
      expect(state.user, null);
    });
  });
}
