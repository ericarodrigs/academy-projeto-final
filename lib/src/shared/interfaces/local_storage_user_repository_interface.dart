import 'package:dartz/dartz.dart';
import 'package:rarovideowall/src/modules/login_module/features/login/model/login_user_model.dart';
import 'package:rarovideowall/src/shared/models/failure.dart';

abstract class ILocalStorageUserRepository {
  Future<Either<Failure, LoginUserModel>> get();

  Future<Either<Failure, void>> save(LoginUserModel userLogin);
}
