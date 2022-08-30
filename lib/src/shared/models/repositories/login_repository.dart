import 'package:rarovideowall/src/shared/global_states/logged_state.dart';
import 'package:rarovideowall/src/shared/interfaces/api_service.dart';

import '../data_models/user_model.dart';

class LoginRepository {
  ApiService service;
  LoggedState loggedState;
  var response;

  LoginRepository({
    required this.service,
    required this.loggedState,
  });

  Future<void> login(var data) async {
    response = await service.request('/auth/login', 'POST', data: data);
    UserModel user = UserModel.fromMap(response.data);
    loggedState.setLogin(user);
    service.setHeaderToken(user.accessToken);
  }

}