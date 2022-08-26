import 'package:dio/dio.dart';
import 'package:rarovideowall/src/shared/interfaces/api_service.dart';

class DioService implements ApiService {
  Dio dio = Dio(BaseOptions(baseUrl: 'http://44.199.200.211:3325'));

  DioService._();

  static final DioService _instance = DioService._();

  static DioService get instance => _instance;

  @override
  Future<dynamic> delete(
    String url, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  }) async {
    Response response = await dio.delete(
      url,
      data: body,
      queryParameters: queryParams,
      options: Options(headers: headers),
    );
    return response;
  }

  @override
  Future<dynamic> get(
    //TODO pegar DioError.response DioErrorType.response
    String url, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  }) async {
    Response response = await dio.get(
      url,
      queryParameters: queryParams,
      options: Options(headers: headers),
    );
    return response;
  }

  @override
  Future<dynamic> patch(
    String url, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  }) async {
    Response response = await dio.patch(
      url,
      data: body,
      queryParameters: queryParams,
      options: Options(headers: headers),
    );
    return response;
  }

  @override
  Future<dynamic> post(
    String url, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  }) async {
    Response response = await dio.post(
      url,
      data: body,
      queryParameters: queryParams,
      options: Options(headers: headers),
    );
    return response;
  }

  @override
  Future<dynamic> put(
    String url, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  }) async {
    Response response = await dio.put(
      url,
      data: body,
      queryParameters: queryParams,
      options: Options(headers: headers),
    );
    return response;
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
