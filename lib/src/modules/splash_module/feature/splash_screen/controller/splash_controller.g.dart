// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SplashController on _SplashController, Store {
  late final _$pageStateAtom =
      Atom(name: '_SplashController.pageState', context: context);

  @override
  PageState get pageState {
    _$pageStateAtom.reportRead();
    return super.pageState;
  }

  @override
  set pageState(PageState value) {
    _$pageStateAtom.reportWrite(value, super.pageState, () {
      super.pageState = value;
    });
  }

  late final _$changePageStateAsyncAction =
      AsyncAction('_SplashController.changePageState', context: context);

  @override
  Future<void> changePageState(PageState state) {
    return _$changePageStateAsyncAction.run(() => super.changePageState(state));
  }

  @override
  String toString() {
    return '''
pageState: ${pageState}
    ''';
  }
}
