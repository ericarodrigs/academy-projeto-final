import 'package:dartz/dartz.dart';
import 'package:rarovideowall/src/shared/interfaces/api_service.dart';
import 'package:rarovideowall/src/shared/models/failure.dart';
import 'package:rarovideowall/src/shared/models/recover_password.dart';
import 'package:rarovideowall/src/shared/models/request_code_model.dart';

class RecoverPasswordRepository {
  ApiService service;

  RecoverPasswordRepository({
    required this.service,
  });

  Future<Either<Failure, void>> requestCode(RequestCodeModel model) async {
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

  Future<Either<Failure, void>> updatePassword(RecoverPasswordModel model) async {
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

}