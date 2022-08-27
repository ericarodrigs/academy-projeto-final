import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:rarovideowall/src/shared/global_states/logged_state.dart';
import 'package:rarovideowall/src/shared/interfaces/api_service.dart';
import 'package:rarovideowall/src/shared/models/data_models/user_model.dart';
import 'package:rarovideowall/src/shared/models/data_sources/login_user_model.dart';
import 'package:rarovideowall/src/shared/models/failure.dart';

class LoginRepository {
  ApiService service;
  LoggedState loggedState;

  LoginRepository({
    required this.service,
    required this.loggedState,
  });

  Future<Either<Failure, UserModel>> login(LoginUserModel userLogin) async {
    try {
      Response response = await service.post('/auth/login', body: {
        "email": userLogin.email,
        "senha": userLogin.password,
      });
      UserModel user = UserModel.fromMap(response.data);
      loggedState.setLogin(user);
      service.setHeaderToken(user.accessToken);
      return Right(user);
    } on DioError catch (err, stackTrace) {
      return Left(Failure(
          message: err.message, object: err.response, stackTrace: stackTrace));
    } on DioErrorType catch (err, stackTrace) {
      return Left(
          Failure(message: err.name, object: err, stackTrace: stackTrace));
    } catch (err, stackTrace) {
      return Left(Failure(
          message: err.toString(), object: err, stackTrace: stackTrace));
    }
  }
}
