import 'package:mobx/mobx.dart';
import 'package:rarovideowall/src/shared/models/data_models/user_model.dart';
part 'logged_state.g.dart';

// ignore: library_private_types_in_public_api
class LoggedState extends _LoggedStateBase with _$LoggedState {
  LoggedState._();
  static final LoggedState _instance = LoggedState._();
  static LoggedState get instance => _instance;
}

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
    user = newUser;
  }

  @action
  void setLogout() {
    _isLogged = true;
    user = null;
  }
}
