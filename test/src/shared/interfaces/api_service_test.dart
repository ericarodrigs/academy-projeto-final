import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarovideowall/src/shared/interfaces/api_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rarovideowall/src/shared/models/failure.dart';

import 'api_service_test.mocks.dart';

@GenerateMocks([ApiService<Response>])
void main() {
  late ApiService service;
  setUpAll(() {
    service = MockApiService();
  });
  group('Test api service', () {
    test('Should return a instance of Response when mode is POST', () async {
      when(service.request('/test', 'POST')).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: 'test'),
        ),
      );
      final response = await service.request('/test', 'POST');
      expect(response, isInstanceOf<Response>());
    });
    test('Should return a instance of Response when mode is GET', () async {
      when(service.request('/test', 'GET')).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: 'test'),
        ),
      );
      final response = await service.request('/test', 'GET');
      expect(response, isInstanceOf<Response>());
    });
    test('Should return a instance of Response when mode is PATCH', () async {
      when(service.request('/test', 'PATCH')).thenAnswer(
        (_) async {
          return Response(
            requestOptions: RequestOptions(path: 'test'),
          );
        },
      );
      final response = await service.request('/test', 'PATCH');
      expect(response, isInstanceOf<Response>());
    });
    test('Should return a instance of Response when mode is PUT', () async {
      when(service.request('/test', 'PUT')).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: 'test'),
        ),
      );
      final response = await service.request('/test', 'PUT');
      expect(response, isInstanceOf<Response>());
    });
    test('Should return a instance of Response when mode is DELETE', () async {
      when(service.request('/test', 'DELETE')).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: 'test'),
        ),
      );
      final response = await service.request('/test', 'DELETE');
      expect(response, isInstanceOf<Response>());
    });
    test('Should return throw an exception of Failure if mode is wrong',
        () async {
      when(service.request('/test', 'POT')).thenThrow(Failure('test'));
      try {
        await service.request('/test', 'POT');
      } on Failure catch (err) {
        expect(err, isInstanceOf<Failure>());
        expect(err.message, Failure('test').message);
      }
    });
  });
}
