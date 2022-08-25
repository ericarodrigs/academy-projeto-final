import 'package:dio/dio.dart';
import 'package:rarovideowall/src/shared/interfaces/api_service.dart';

class DioService implements ApiService {
  static const baseUrl = 'http://44.199.200.211:3325';

  @override
  Future<dynamic> delete(
    String url, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  }) async {
    Response response = await Dio().delete(
      baseUrl + url,
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
    Response response = await Dio().get(
      baseUrl + url,
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
    Response response = await Dio().patch(
      baseUrl + url,
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
    Response response = await Dio().post(
      baseUrl + url,
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
    Response response = await Dio().put(
      baseUrl + url,
      data: body,
      queryParameters: queryParams,
      options: Options(headers: headers),
    );
    return response;
  }
}
