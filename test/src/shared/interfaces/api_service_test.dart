import 'package:flutter_test/flutter_test.dart';
import 'package:rarovideowall/src/modules/login_module/features/login/model/login_user_model.dart';
import 'package:rarovideowall/src/modules/login_module/features/recover_password/model/recover_password_model.dart';
import 'package:rarovideowall/src/modules/login_module/features/recover_password/model/request_code_model.dart';
import 'package:rarovideowall/src/modules/login_module/features/register/model/register_user_model.dart';
import 'package:rarovideowall/src/shared/interfaces/api_service.dart';

import '../../../mocks/api_service_test/api_service_test.generate.dart';
import '../../../mocks/mock_data.dart';

void main() {
  late ApiService service;
  setUpAll(() {
    final stubs = ApiServiceStubs();
    service = stubs.mock;
    stubs.registerStubs();
  });
  group('Test api service', () {
    group('Video routes test', () {
      test(
          'Should return a Response with public videos when route /videos is called',
          () async {
        final response = await service.request(
          '/videos',
          'GET',
          queryParams: {
            'pagina': 1,
            'itensPorPagina': 100,
            'orderBy': 'dataPublicacao',
            'orderDirection': 'ASC',
          },
        );
        expect(response.data, publicVideos);
      });
      test(
          'Should return a Response with logged videos when header token is set',
          () async {
        service.setHeaderToken(authLogin['access_token'].toString());
        final response = await service.request(
          '/videos',
          'GET',
          queryParams: {
            'pagina': 1,
            'itensPorPagina': 100,
            'orderBy': 'dataPublicacao',
            'orderDirection': 'ASC',
          },
        );
        expect(response.data, loggedVideos);
      });
      test(
          'Should return a Response with public videos when header token is clear',
          () async {
        service.setHeaderToken(authLogin['access_token'].toString());
        service.clearHeaderToken();
        final response = await service.request(
          '/videos',
          'GET',
          queryParams: {
            'pagina': 1,
            'itensPorPagina': 100,
            'orderBy': 'dataPublicacao',
            'orderDirection': 'ASC',
          },
        );
        expect(response.data, publicVideos);
      });
      test(
          'Should return a Response with empty list when route /videos/favoritos is called',
          () async {
        final response = await service.request(
          '/videos/favoritos',
          'GET',
          queryParams: {
            'pagina': 1,
            'itensPorPagina': 100,
            'orderBy': 'dataPublicacao',
            'orderDirection': 'ASC',
          },
        );
        expect(response.data, []);
      });
      test(
          'Should return a Response with a list with the firstVideo when route /videos/firstVideoId/recomendacoes is called',
          () async {
        final response = await service.request(
          '/videos/$firstVideoId/recomendacoes',
          'GET',
          queryParams: {
            'itensPorPagina': 10,
          },
        );
        expect(response.data, [firstVideo]);
      });
      test(
          'Should return a Response with the firstVideo when route /videos/firstVideoId is called',
          () async {
        final response = await service.request(
          '/videos/$firstVideoId',
          'GET',
        );
        expect(response.data, firstVideo);
      });
      test(
          'Should return a status code 204 when route /videos/firstVideoId is called for Delete and Post mode',
          () async {
        var response = await service.request(
          '/videos/$firstVideoId/favoritos',
          'DELETE',
        );
        expect(response.statusCode, 204);
        response = await service.request(
          '/videos/$firstVideoId/favoritos',
          'POST',
        );
        expect(response.statusCode, 204);
      });
      test(
          'Should add and remove the firstVideo in /videos/favorite when  /videos/firstVideoId is called with Post and Delete',
          () async {
        await service.request(
          '/videos/$firstVideoId/favoritos',
          'POST',
        );
        var response = await service.request(
          '/videos/favoritos',
          'GET',
          queryParams: {
            'pagina': 1,
            'itensPorPagina': 100,
            'orderBy': 'dataPublicacao',
            'orderDirection': 'ASC',
          },
        );
        expect(response.data, [firstVideo]);
        await service.request(
          '/videos/$firstVideoId/favoritos',
          'DELETE',
        );
        response = await service.request(
          '/videos/favoritos',
          'GET',
          queryParams: {
            'pagina': 1,
            'itensPorPagina': 100,
            'orderBy': 'dataPublicacao',
            'orderDirection': 'ASC',
          },
        );
        expect(response.data, []);
      });
    });
    group('Login routes test', () {
      test(
          'Should return a access_token correct when /auth/login is called with email: test and password: test',
          () async {
        final response = await service.request(
          '/auth/login',
          'POST',
          body: LoginUserModel(
            email: 'test',
            password: 'test',
          ).toMap(),
        );
        expect(response.data['access_token'], authLogin['access_token']);
      });

      test(
          'Should return a Response with authRegister when route /auth/cadastrar is called with correct register params',
          () async {
        final response = await service.request(
          '/auth/cadastrar',
          'POST',
          body: RegisterUserModel(
            accessCode: '55402f9b-ca01-4cb4-ae36-dc85d7e154b8',
            email: 'test',
            name: 'test',
            password: 'test',
          ).toMap(),
        );
        expect(response.data, authRegister);
      });
      test(
          'Should return a Response with statusCode 201 when route /auth/solicitar-codigo is called with email: test',
          () async {
        final response = await service.request(
          '/auth/solicitar-codigo',
          'POST',
          body: RequestCodeModel(email: 'test').toMap(),
        );
        expect(response.statusCode, 201);
      });
      test(
          'Should return a Response with statusCode 201 when route /auth/recuperar-senha is called with code: 12345',
          () async {
        final response = await service.request(
          '/auth/recuperar-senha',
          'PATCH',
          body: RecoverPasswordModel(
            code: '12345',
            newPassword: 'test2',
          ).toMap(),
        );
        expect(response.statusCode, 201);
      });
    });
  });
}
