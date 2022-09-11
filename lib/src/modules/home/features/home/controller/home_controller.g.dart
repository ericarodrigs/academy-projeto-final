// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeControllerBase, Store {
  late final _$hasImgAvatarErrorAtom =
      Atom(name: '_HomeControllerBase.hasImgAvatarError', context: context);

  @override
  bool get hasImgAvatarError {
    _$hasImgAvatarErrorAtom.reportRead();
    return super.hasImgAvatarError;
  }

  @override
  set hasImgAvatarError(bool value) {
    _$hasImgAvatarErrorAtom.reportWrite(value, super.hasImgAvatarError, () {
      super.hasImgAvatarError = value;
    });
  }

  late final _$playlistOptionAtom =
      Atom(name: '_HomeControllerBase.playlistOption', context: context);

  @override
  Playlist get playlistOption {
    _$playlistOptionAtom.reportRead();
    return super.playlistOption;
  }

  @override
  set playlistOption(Playlist value) {
    _$playlistOptionAtom.reportWrite(value, super.playlistOption, () {
      super.playlistOption = value;
    });
  }

  late final _$homeStateAtom =
      Atom(name: '_HomeControllerBase.homeState', context: context);

  @override
  LoadState get homeState {
    _$homeStateAtom.reportRead();
    return super.homeState;
  }

  @override
  set homeState(LoadState value) {
    _$homeStateAtom.reportWrite(value, super.homeState, () {
      super.homeState = value;
    });
  }

  late final _$errorTextAtom =
      Atom(name: '_HomeControllerBase.errorText', context: context);

  @override
  String get errorText {
    _$errorTextAtom.reportRead();
    return super.errorText;
  }

  @override
  set errorText(String value) {
    _$errorTextAtom.reportWrite(value, super.errorText, () {
      super.errorText = value;
    });
  }

  late final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase', context: context);

  @override
  void onLoadImgError(BuildContext context) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.onLoadImgError');
    try {
      return super.onLoadImgError(context);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPlaylistOption(Playlist option) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setPlaylistOption');
    try {
      return super.setPlaylistOption(option);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHomeState(Either<Failure, LoadState> newStateEither) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setHomeState');
    try {
      return super.setHomeState(newStateEither);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
hasImgAvatarError: ${hasImgAvatarError},
playlistOption: ${playlistOption},
homeState: ${homeState},
errorText: ${errorText}
    ''';
  }
}
