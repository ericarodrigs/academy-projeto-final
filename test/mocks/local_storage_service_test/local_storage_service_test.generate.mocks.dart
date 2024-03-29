// Mocks generated by Mockito 5.3.0 from annotations
// in rarovideowall/test/mocks/local_storage_service_test/local_storage_service_test.generate.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:rarovideowall/src/shared/interfaces/local_storage_service.dart'
    as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [LocalStorageService].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocalStorageService extends _i1.Mock
    implements _i2.LocalStorageService {
  MockLocalStorageService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<void> save(String? key, String? data) => (super.noSuchMethod(
      Invocation.method(#save, [key, data]),
      returnValue: _i3.Future<void>.value(),
      returnValueForMissingStub: _i3.Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<String?> read(String? key) =>
      (super.noSuchMethod(Invocation.method(#read, [key]),
          returnValue: _i3.Future<String?>.value()) as _i3.Future<String?>);
  @override
  _i3.Future<void> delete(String? key) => (super.noSuchMethod(
      Invocation.method(#delete, [key]),
      returnValue: _i3.Future<void>.value(),
      returnValueForMissingStub: _i3.Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<void> deleteAll() => (super.noSuchMethod(
      Invocation.method(#deleteAll, []),
      returnValue: _i3.Future<void>.value(),
      returnValueForMissingStub: _i3.Future<void>.value()) as _i3.Future<void>);
}
