import 'package:dio/dio.dart';
import 'package:rarovideowall/src/shared/global_states/logged_state.dart';
import 'package:rarovideowall/src/shared/interfaces/api_service.dart';
import 'package:rarovideowall/src/shared/models/data_models/login_user_model.dart';

import '../data_models/user_model.dart';

class LoginRepository {
  ApiService service;
  LoggedState loggedState;

  LoginRepository({
    required this.service,
    required this.loggedState,
  });

  Future<void> login(LoginUserModel data) async {
    Response response =
        await service.request('/auth/login', 'POST', data: data.toMap());
    UserModel user = UserModel.fromMap(response.data);
    loggedState.setLogin(user);
    service.setHeaderToken(user.accessToken);
  }
}
