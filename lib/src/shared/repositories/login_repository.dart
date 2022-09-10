import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rarovideowall/src/shared/global_states/logged_state/logged_state.dart';
import 'package:rarovideowall/src/shared/interfaces/api_service.dart';
import 'package:rarovideowall/src/shared/interfaces/login_repository_interface.dart';
import 'package:rarovideowall/src/shared/models/failure.dart';
import 'package:rarovideowall/src/modules/login_module/features/login/model/login_user_model.dart';
import 'package:rarovideowall/src/modules/login_module/features/register/model/register_user_model.dart';
import 'package:rarovideowall/src/modules/login_module/features/recover_password/model/recover_password_model.dart';
import 'package:rarovideowall/src/modules/login_module/features/recover_password/model/request_code_model.dart';
import 'package:rarovideowall/src/shared/models/user_model.dart';
import 'package:rarovideowall/src/shared/repositories/local_storage_user_repository.dart';

class LoginRepository implements ILoginRepository {
  final ApiService service;
  final LoggedState loggedState;
  final LocalStorageUserRepository localStorageUserRepository;

  LoginRepository({
    required this.service,
    required this.loggedState,
    required this.localStorageUserRepository,
  });

  @override
  Future<Either<Failure, UserModel>> login(LoginUserModel userLogin) async {
    try {
      Response response = await service.request(
        '/auth/login',
        'POST',
        body: userLogin.toMap(),
      );
      UserModel user = UserModel.fromMap(response.data);
      loggedState.setLogin(user);
      service.setHeaderToken(user.accessToken);
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
      await service.request(
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
  Future<Either<Failure, void>> requestCode(model) async {
    try {
      await service.request(
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
      model) async {
    try {
      await service.request(
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
  void logout() {
    service.clearHeaderToken();
    loggedState.setLogout();
    localStorageUserRepository.deleteAll();
  }
}
