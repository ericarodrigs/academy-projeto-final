import 'package:dio/dio.dart';
import 'package:rarovideowall/src/shared/interfaces/api_service.dart';
import 'package:rarovideowall/src/shared/models/failure.dart';

class DioService implements ApiService {
  Dio dio = Dio(BaseOptions(baseUrl: 'http://44.199.200.211:3325'));

  DioService._();

  static final DioService _instance = DioService._();

  static DioService get instance => _instance;

  @override
  Future<dynamic> request(
    String url,
    String mode, {
    dynamic body,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  }) async {
    try {
      return await dio.request(url,
          data: body,
          queryParameters: queryParams,
          options: Options(
            method: mode,
            headers: headers,
          ));
    } on DioError catch (err, stackTrace) {
      switch (err.type) {
        case DioErrorType.connectTimeout:
        case DioErrorType.sendTimeout:
        case DioErrorType.receiveTimeout:
          throw Failure(
            'A conexão foi encerrada, tente novamente.',
            object: err,
            stackTrace: stackTrace,
          );
        case DioErrorType.response:
          switch (err.response?.statusCode) {
            case 400:
              throw Failure(
                'Requisição inválida',
                object: err,
                stackTrace: stackTrace,
              );
            case 401:
              throw Failure(
                'Usuário ou senha inválidos.',
                object: err,
                stackTrace: stackTrace,
              );
            case 404:
              throw Failure(
                'A informação requisitada não pode ser encontrada.',
                object: err,
                stackTrace: stackTrace,
              );
            case 409:
              throw Failure(
                'Ocorreu um conflito',
                object: err,
                stackTrace: stackTrace,
              );
            default: //500
              throw Failure(
                'Ocorreu um erro inesperado, tente novamente.',
                object: err,
                stackTrace: stackTrace,
              );
          }
        case DioErrorType.cancel:
          throw Failure(
            'Requisição cancelada.',
            object: err,
            stackTrace: stackTrace,
          );
        default:
          throw Failure(
            'Sem conexão.',
            object: err,
            stackTrace: stackTrace,
          );
      }
    }
  }

  @override
  void setHeaderToken(String token) {
    dio.options.headers.addAll({'Authorization': 'Bearer $token'});
  }

  @override
  void clearHeaderToken() {
    dio.options.headers.clear();
  }
}
