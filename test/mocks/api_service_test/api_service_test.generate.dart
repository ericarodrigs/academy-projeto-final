import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rarovideowall/src/modules/login_module/features/login/model/login_user_model.dart';
import 'package:rarovideowall/src/modules/login_module/features/recover_password/model/recover_password_model.dart';
import 'package:rarovideowall/src/modules/login_module/features/recover_password/model/request_code_model.dart';
import 'package:rarovideowall/src/modules/login_module/features/register/model/register_user_model.dart';
import 'package:rarovideowall/src/shared/interfaces/api_service.dart';

import '../mock_data.dart';
import 'api_service_test.mocks.dart';

@GenerateMocks([ApiService<Response>])
class ApiServiceStubs {
  final ApiService _service = MockApiService();

  ApiService get mock => _service;

  bool _logged = false;

  bool _isFavorite = false;

  void registerStubs() {
    when(_service.request(
      '/videos',
      'GET',
      queryParams: {
        'pagina': 1,
        'itensPorPagina': 100,
        'orderBy': 'dataPublicacao',
        'orderDirection': 'ASC',
      },
    )).thenAnswer(
      _logged
          ? (_) async => loggedVideosResponse
          : (_) async => publicVideosResponse,
    );

    when(_service.request(
      '/videos/favoritos',
      'GET',
      queryParams: {
        'pagina': 1,
        'itensPorPagina': 100,
        'orderBy': 'dataPublicacao',
        'orderDirection': 'ASC',
      },
    )).thenAnswer(
      _isFavorite
          ? (_) async => firstVideoListResponse
          : (_) async => emptyFavoriteVideosResponse,
    );

    when(_service.request(
      '/videos/$firstVideoId/recomendacoes',
      'GET',
      queryParams: {
        'itensPorPagina': 10,
      },
    )).thenAnswer((_) async => firstVideoListResponse);

    when(_service.request(
      '/videos/$firstVideoId',
      'GET',
    )).thenAnswer((_) async => firstVideoResponse);

    when(_service.request(
      '/videos/$firstVideoId/favoritos',
      'DELETE',
    )).thenAnswer((_) async {
      _isFavorite = false;
      registerStubs();
      return favoriteVideoResponse;
    });

    when(_service.request(
      '/videos/$firstVideoId/favoritos',
      'POST',
    )).thenAnswer((_) async {
      _isFavorite = true;
      registerStubs();
      return favoriteVideoResponse;
    });

    when(_service.setHeaderToken(authLogin['access_token'].toString()))
        .thenAnswer((_) {
      _logged = true;
      registerStubs();
    });

    when(_service.clearHeaderToken()).thenAnswer((_) {
      _logged = false;
      registerStubs();
    });

    /**--------------------------------------------
     **               login routes stubs
     *---------------------------------------------**/

    when(_service.request(
      '/auth/login',
      'POST',
      body: LoginUserModel(
        email: 'test',
        password: 'test',
      ).toMap(),
    )).thenAnswer((_) async => authLoginResponse);

    when(_service.request(
      '/auth/cadastrar',
      'POST',
      body: RegisterUserModel(
        accessCode: '55402f9b-ca01-4cb4-ae36-dc85d7e154b8',
        email: 'test',
        name: 'test',
        password: 'test',
      ).toMap(),
    )).thenAnswer((_) async => authRegisterResponse);

    when(_service.request(
      '/auth/solicitar-codigo',
      'POST',
      body: RequestCodeModel(email: 'test').toMap(),
    )).thenAnswer((_) async => authCodResponse);

    when(_service.request(
      '/auth/recuperar-senha',
      'PATCH',
      body: RecoverPasswordModel(
        code: '12345',
        newPassword: 'test2',
      ).toMap(),
    )).thenAnswer((_) async => authRecoverResponse);
  }
}
