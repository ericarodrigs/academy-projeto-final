import 'package:dio/dio.dart';
import 'package:rarovideowall/src/shared/interfaces/api_service.dart';

class DioService implements ApiService {
  Dio dio = Dio(BaseOptions(baseUrl: 'http://44.199.200.211:3325'));

  DioService._();

  static final DioService _instance = DioService._();

  static DioService get instance => _instance;

  @override
  Future<dynamic> request(String url, String mode,
      {dynamic data, Map<String, dynamic>? queryParams}) async {
    try {
      return await dio.request<Map<String, dynamic>>(url,
          data: data,
          queryParameters: queryParams,
          options: Options(method: mode));
    } on DioError catch (e) {
      switch (e.type) {
        case DioErrorType.connectTimeout:
        case DioErrorType.sendTimeout:
        case DioErrorType.receiveTimeout:
          throw 'A conexão foi encerrada, tente novamente.';
        case DioErrorType.response:
          switch (e.response?.statusCode) {
            case 400:
              throw 'Requisição inválida';
            case 401:
              throw 'Usuário ou senha inválidos.';
            case 404:
              throw 'A informação requisitada não pode ser encontrada.';
            case 409:
              throw 'Ocorreu um conflito';
            default: //500
              throw 'Ocorreu um erro inesperado, tente novamente.';
          }
        case DioErrorType.cancel:
          throw 'Requisição cancelada.';
        default:
          throw 'Sem conexão.';
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
