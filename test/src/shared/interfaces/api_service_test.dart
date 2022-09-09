import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarovideowall/src/shared/interfaces/api_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'api_service_test.mocks.dart';

@GenerateMocks([ApiService])
void main() {
  late ApiService<Response> service;
  setUpAll(() {
    service = MockApiService<Response>();
  });
  group('Test api service', () async {
    test('')
  });
}
