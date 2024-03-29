import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:rarovideowall/src/modules/login_module/features/login/model/login_user_model.dart';
import 'package:rarovideowall/src/modules/login_module/features/recover_password/model/recover_password_model.dart';
import 'package:rarovideowall/src/modules/login_module/features/recover_password/model/request_code_model.dart';
import 'package:rarovideowall/src/modules/login_module/features/register/model/register_user_model.dart';
import 'package:rarovideowall/src/shared/global_states/logged_state/logged_state.dart';
import 'package:rarovideowall/src/shared/interfaces/api_service.dart';
import 'package:rarovideowall/src/shared/interfaces/local_storage_service.dart';
import 'package:rarovideowall/src/shared/interfaces/login_repository_interface.dart';
import 'package:rarovideowall/src/shared/models/failure.dart';
import 'package:rarovideowall/src/shared/models/user_model.dart';

class LoginRepository implements ILoginRepository {
  final ApiService apiService;
  final LocalStorageService localStorageService;
  final LoggedState loggedState;

  LoginRepository({
    required this.apiService,
    required this.localStorageService,
    required this.loggedState,
  });

  @override
  Future<Either<Failure, UserModel>> login(LoginUserModel userLogin) async {
    try {
      Response response = await apiService.request(
        '/auth/login',
        'POST',
        body: userLogin.toMap(),
      );
      UserModel user = UserModel.fromMap(response.data);
      loggedState.setLogin(user);
      apiService.setHeaderToken(user.accessToken);
      return Right(user);
    } on Failure catch (fail) {
      return Left(fail);
    } catch (err, stackTrace) {
      return Left(Failure(
        'Erro inesperado',
        object: err,
        stackTrace: stackTrace,
      ));
    }
  }

  @override
  Future<Either<Failure, void>> register(RegisterUserModel userRegister) async {
    try {
      await apiService.request(
        '/auth/cadastrar',
        'POST',
        body: userRegister.toMap(),
      );
      return const Right(null);
    } on Failure catch (fail) {
      return Left(fail);
    } catch (err, stackTrace) {
      return Left(Failure(
        'Erro inesperado',
        object: err,
        stackTrace: stackTrace,
      ));
    }
  }

  @override
  Future<Either<Failure, void>> requestCode(RequestCodeModel model) async {
    try {
      await apiService.request(
        '/auth/solicitar-codigo',
        'POST',
        body: model.toMap(),
      );
      return const Right(null);
    } on Failure catch (fail) {
      return Left(fail);
    } catch (err, stackTrace) {
      return Left(Failure(
        'Erro inesperado',
        object: err,
        stackTrace: stackTrace,
      ));
    }
  }

  @override
  Future<Either<Failure, void>> updatePassword(
      RecoverPasswordModel model) async {
    try {
      await apiService.request(
        '/auth/recuperar-senha',
        'PATCH',
        body: model.toMap(),
      );
      return const Right(null);
    } on Failure catch (fail) {
      return Left(fail);
    } catch (err, stackTrace) {
      return Left(Failure(
        'Erro inesperado',
        object: err,
        stackTrace: stackTrace,
      ));
    }
  }

  @override
  void logout() async {
    apiService.clearHeaderToken();
    loggedState.setLogout();
    await localStorageService.deleteAll();
  }
}
