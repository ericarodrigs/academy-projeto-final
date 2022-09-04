import 'package:dartz/dartz.dart';
import 'package:rarovideowall/src/shared/interfaces/api_service.dart';
import 'package:rarovideowall/src/shared/models/failure.dart';
import 'package:rarovideowall/src/shared/models/register_user_model.dart';

class RegisterRepository {
  ApiService service;

  RegisterRepository({
    required this.service,
  });

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
}
