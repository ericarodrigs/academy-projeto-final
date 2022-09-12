import 'package:dartz/dartz.dart';
import 'package:rarovideowall/src/shared/constants/keys_storage.dart';
import 'package:rarovideowall/src/shared/interfaces/local_storage_service.dart';
import 'package:rarovideowall/src/shared/interfaces/local_storage_user_repository_interface.dart';

import 'package:rarovideowall/src/shared/models/failure.dart';
import 'package:rarovideowall/src/modules/login_module/features/login/model/login_user_model.dart';

class LocalStorageUserRepository implements ILocalStorageUserRepository {
  LocalStorageService service;

  LocalStorageUserRepository({
    required this.service,
  });

  @override
  Future<Either<Failure, LoginUserModel>> get() async {
    try {
      String? email = await service.read(KeysStorage.email);
      String? password = await service.read(KeysStorage.password);
      if (email != null && password != null) {
        return Right(LoginUserModel(email: email, password: password));
      } else {
        return Left(Failure('Usuário não encontrado.'));
      }
    } catch (err, stackTrace) {
      return Left(Failure(err.toString(), object: err, stackTrace: stackTrace));
    }
  }

  @override
  Future<Either<Failure, void>> save(LoginUserModel userLogin) async {
    try {
      await service.save(KeysStorage.email, userLogin.email);
      await service.save(KeysStorage.password, userLogin.password);
      return const Right(null);
    } catch (err, stackTrace) {
      return Left(Failure(err.toString(), object: err, stackTrace: stackTrace));
    }
  }
}
