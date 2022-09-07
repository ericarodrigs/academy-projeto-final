import 'package:dartz/dartz.dart';
import 'package:rarovideowall/src/shared/constants/keys_share_preferences.dart';

import 'package:rarovideowall/src/shared/interfaces/local_storage_service.dart';
import 'package:rarovideowall/src/shared/models/failure.dart';
import 'package:rarovideowall/src/modules/login_module/features/login/model/login_user_model.dart';

class LocalStorageUserRepository {
  LocalStorageService service;

  LocalStorageUserRepository({
    required this.service,
  });

  Future<Either<Failure, LoginUserModel>> get() async {
    try {
      String? loginUserModelJson = await service.read(KeysSharedPreferences.userLogin);
      if (loginUserModelJson != null) {
        return Right(LoginUserModel.fromJson(loginUserModelJson));
      } else {
        return Left(Failure('Usuário não encontrado.'));
      }
    } catch (err, stackTrace) {
      return Left(Failure(err.toString(), object: err, stackTrace: stackTrace));
    }
  }

  Future<Either<Failure, void>> save(LoginUserModel userLogin) async {
    try {
      await service.save(KeysSharedPreferences.userLogin, userLogin.toJson());
      return const Right(null);
    } catch (err, stackTrace) {
      return Left(Failure(err.toString(), object: err, stackTrace: stackTrace));
    }
  }

  Future<Either<Failure, void>> delete() async {
    try {
      await service.delete(KeysSharedPreferences.userLogin);
      return const Right(null);
    } catch (err, stackTrace) {
      return Left(Failure(err.toString(), object: err, stackTrace: stackTrace));
    }
  }
}
