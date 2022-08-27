import 'package:dartz/dartz.dart';

import 'package:rarovideowall/src/shared/interfaces/local_storage_service.dart';
import 'package:rarovideowall/src/shared/models/data_models/login_user_model.dart';
import 'package:rarovideowall/src/shared/models/failure.dart';

class LocalStorageUserRepository {
  LocalStorageService service;
  LocalStorageUserRepository({
    required this.service,
  });

  Future<Either<Failure, LoginUserModel>> get() async {
    try {
      String? loginUserModelJson = await service.read('userLogin');
      if (loginUserModelJson != null) {
        return Right(LoginUserModel.fromJson(loginUserModelJson));
      } else {
        return Left(Failure(message: 'Usuário não encontrado.'));
      }
    } catch (err, stackTrace) {
      return Left(Failure(
          message: err.toString(), object: err, stackTrace: stackTrace));
    }
  }

  Future<Either<Failure, bool>> save(LoginUserModel userLogin) async {
    try {
      bool serviceResp = await service.save('userLogin', userLogin.toJson());
      return Right(serviceResp);
    } catch (err, stackTrace) {
      return Left(Failure(
          message: err.toString(), object: err, stackTrace: stackTrace));
    }
  }

  Future<Either<Failure, bool>> delete() async {
    try {
      bool serviceResp = await service.delete('userLogin');
      return Right(serviceResp);
    } catch (err, stackTrace) {
      return Left(Failure(
          message: err.toString(), object: err, stackTrace: stackTrace));
    }
  }
}
