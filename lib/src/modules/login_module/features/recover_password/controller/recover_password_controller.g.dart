// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recover_password_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RecoverPasswordController on _RecoverPasswordController, Store {
  late final _$loadStateAtom =
      Atom(name: '_RecoverPasswordController.loadState', context: context);

  @override
  LoadState get loadState {
    _$loadStateAtom.reportRead();
    return super.loadState;
  }

  @override
  set loadState(LoadState value) {
    _$loadStateAtom.reportWrite(value, super.loadState, () {
      super.loadState = value;
    });
  }

  late final _$pageStateAtom =
      Atom(name: '_RecoverPasswordController.pageState', context: context);

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

  late final _$isHiddenPasswordAtom = Atom(
      name: '_RecoverPasswordController.isHiddenPassword', context: context);

  @override
  bool get isHiddenPassword {
    _$isHiddenPasswordAtom.reportRead();
    return super.isHiddenPassword;
  }

  @override
  set isHiddenPassword(bool value) {
    _$isHiddenPasswordAtom.reportWrite(value, super.isHiddenPassword, () {
      super.isHiddenPassword = value;
    });
  }

  late final _$isHiddenConfirmPasswordAtom = Atom(
      name: '_RecoverPasswordController.isHiddenConfirmPassword',
      context: context);

  @override
  bool get isHiddenConfirmPassword {
    _$isHiddenConfirmPasswordAtom.reportRead();
    return super.isHiddenConfirmPassword;
  }

  @override
  set isHiddenConfirmPassword(bool value) {
    _$isHiddenConfirmPasswordAtom
        .reportWrite(value, super.isHiddenConfirmPassword, () {
      super.isHiddenConfirmPassword = value;
    });
  }

  late final _$changeLoadStateAsyncAction = AsyncAction(
      '_RecoverPasswordController.changeLoadState',
      context: context);

  @override
  Future<void> changeLoadState(LoadState state) {
    return _$changeLoadStateAsyncAction.run(() => super.changeLoadState(state));
  }

  late final _$changePageStateAsyncAction = AsyncAction(
      '_RecoverPasswordController.changePageState',
      context: context);

  @override
  Future<void> changePageState(PageState state) {
    return _$changePageStateAsyncAction.run(() => super.changePageState(state));
  }

  late final _$changePasswordVisibilityAsyncAction = AsyncAction(
      '_RecoverPasswordController.changePasswordVisibility',
      context: context);

  @override
  Future<void> changePasswordVisibility() {
    return _$changePasswordVisibilityAsyncAction
        .run(() => super.changePasswordVisibility());
  }

  late final _$changeConfirmPasswordVisibilityAsyncAction = AsyncAction(
      '_RecoverPasswordController.changeConfirmPasswordVisibility',
      context: context);

  @override
  Future<void> changeConfirmPasswordVisibility() {
    return _$changeConfirmPasswordVisibilityAsyncAction
        .run(() => super.changeConfirmPasswordVisibility());
  }

  @override
  String toString() {
    return '''
loadState: ${loadState},
pageState: ${pageState},
isHiddenPassword: ${isHiddenPassword},
isHiddenConfirmPassword: ${isHiddenConfirmPassword}
    ''';
  }
}
