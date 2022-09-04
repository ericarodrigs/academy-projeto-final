import 'package:dartz/dartz.dart';
import 'package:rarovideowall/src/shared/models/failure.dart';
import 'package:rarovideowall/src/shared/models/login_user_model.dart';
import 'package:rarovideowall/src/shared/models/register_user_model.dart';
import 'package:rarovideowall/src/shared/models/user_model.dart';

abstract class ILoginRepository {
  Future<Either<Failure, UserModel>> login(LoginUserModel userLogin);

  Future<Either<Failure, void>> register(RegisterUserModel userRegister);

  void logout();
}
