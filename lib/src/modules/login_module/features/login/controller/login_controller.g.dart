// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginController on _LoginController, Store {
  late final _$loadStateAtom =
      Atom(name: '_LoginController.loadState', context: context);

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
      Atom(name: '_LoginController.pageState', context: context);

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

  late final _$isHiddenPasswordAtom =
      Atom(name: '_LoginController.isHiddenPassword', context: context);

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

  late final _$isCheckedAtom =
      Atom(name: '_LoginController.isChecked', context: context);

  @override
  bool get isChecked {
    _$isCheckedAtom.reportRead();
    return super.isChecked;
  }

  @override
  set isChecked(bool value) {
    _$isCheckedAtom.reportWrite(value, super.isChecked, () {
      super.isChecked = value;
    });
  }

  late final _$changeLoadStateAsyncAction =
      AsyncAction('_LoginController.changeLoadState', context: context);

  @override
  Future<void> changeLoadState(LoadState state) {
    return _$changeLoadStateAsyncAction.run(() => super.changeLoadState(state));
  }

  late final _$changePageStateAsyncAction =
      AsyncAction('_LoginController.changePageState', context: context);

  @override
  Future<void> changePageState(PageState state) {
    return _$changePageStateAsyncAction.run(() => super.changePageState(state));
  }

  late final _$changePasswordVisibilityAsyncAction = AsyncAction(
      '_LoginController.changePasswordVisibility',
      context: context);

  @override
  Future<void> changePasswordVisibility() {
    return _$changePasswordVisibilityAsyncAction
        .run(() => super.changePasswordVisibility());
  }

  late final _$_LoginControllerActionController =
      ActionController(name: '_LoginController', context: context);

  @override
  void toggleChecked() {
    final _$actionInfo = _$_LoginControllerActionController.startAction(
        name: '_LoginController.toggleChecked');
    try {
      return super.toggleChecked();
    } finally {
      _$_LoginControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loadState: ${loadState},
pageState: ${pageState},
isHiddenPassword: ${isHiddenPassword},
isChecked: ${isChecked}
    ''';
  }
}
