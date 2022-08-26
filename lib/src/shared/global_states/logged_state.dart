import 'package:mobx/mobx.dart';
import 'package:rarovideowall/src/shared/models/user_model.dart';
part 'logged_state.g.dart';

// ignore: library_private_types_in_public_api
class LoggedState = _LoggedStateBase with _$LoggedState;

abstract class _LoggedStateBase with Store {
  _LoggedStateBase()
      : _isLogged = false,
        user = null;

  UserModel? user;

  @observable
  bool _isLogged;

  bool get isLogged => _isLogged;

  @action
  void setLogin(UserModel newUser) {
    _isLogged = true;
    user = UserModel();
    user!.copyWith(newUser);
  }

  @action
  void setLogout() {
    _isLogged = true;
    user = null;
  }
}
