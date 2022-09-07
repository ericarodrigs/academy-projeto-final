import 'package:dartz/dartz.dart';
import 'package:rarovideowall/src/shared/models/failure.dart';
import 'package:rarovideowall/src/shared/models/login_user_model.dart';
import 'package:rarovideowall/src/modules/login_module/features/register/model/register_user_model.dart';
import 'package:rarovideowall/src/shared/models/recover_password.dart';
import 'package:rarovideowall/src/shared/models/request_code_model.dart';
import 'package:rarovideowall/src/shared/models/user_model.dart';

abstract class ILoginRepository {
  Future<Either<Failure, UserModel>> login(LoginUserModel userLogin);

  Future<Either<Failure, void>> register(RegisterUserModel userRegister);

  Future<Either<Failure, void>> requestCode(RequestCodeModel model);

  Future<Either<Failure, void>> updatePassword(RecoverPasswordModel model);

  void logout();
}
