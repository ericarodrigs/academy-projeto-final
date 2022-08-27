// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logged_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoggedState on _LoggedStateBase, Store {
  late final _$_isLoggedAtom =
      Atom(name: '_LoggedStateBase._isLogged', context: context);

  @override
  bool get _isLogged {
    _$_isLoggedAtom.reportRead();
    return super._isLogged;
  }

  @override
  set _isLogged(bool value) {
    _$_isLoggedAtom.reportWrite(value, super._isLogged, () {
      super._isLogged = value;
    });
  }

  late final _$_LoggedStateBaseActionController =
      ActionController(name: '_LoggedStateBase', context: context);

  @override
  void setLogin(UserModel newUser) {
    final _$actionInfo = _$_LoggedStateBaseActionController.startAction(
        name: '_LoggedStateBase.setLogin');
    try {
      return super.setLogin(newUser);
    } finally {
      _$_LoggedStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLogout() {
    final _$actionInfo = _$_LoggedStateBaseActionController.startAction(
        name: '_LoggedStateBase.setLogout');
    try {
      return super.setLogout();
    } finally {
      _$_LoggedStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
