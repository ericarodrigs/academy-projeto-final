// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VideoController on _VideoControllerBase, Store {
  late final _$videoAtom =
      Atom(name: '_VideoControllerBase.video', context: context);

  @override
  VideoModel get video {
    _$videoAtom.reportRead();
    return super.video;
  }

  @override
  set video(VideoModel value) {
    _$videoAtom.reportWrite(value, super.video, () {
      super.video = value;
    });
  }

  late final _$relatedVideosAtom =
      Atom(name: '_VideoControllerBase.relatedVideos', context: context);

  @override
  List<VideoModel> get relatedVideos {
    _$relatedVideosAtom.reportRead();
    return super.relatedVideos;
  }

  @override
  set relatedVideos(List<VideoModel> value) {
    _$relatedVideosAtom.reportWrite(value, super.relatedVideos, () {
      super.relatedVideos = value;
    });
  }

  late final _$isFavoriteAtom =
      Atom(name: '_VideoControllerBase.isFavorite', context: context);

  @override
  bool get isFavorite {
    _$isFavoriteAtom.reportRead();
    return super.isFavorite;
  }

  @override
  set isFavorite(bool value) {
    _$isFavoriteAtom.reportWrite(value, super.isFavorite, () {
      super.isFavorite = value;
    });
  }

  late final _$videoLoadStateAtom =
      Atom(name: '_VideoControllerBase.videoLoadState', context: context);

  @override
  LoadState get videoLoadState {
    _$videoLoadStateAtom.reportRead();
    return super.videoLoadState;
  }

  @override
  set videoLoadState(LoadState value) {
    _$videoLoadStateAtom.reportWrite(value, super.videoLoadState, () {
      super.videoLoadState = value;
    });
  }

  late final _$recommendedStateAtom =
      Atom(name: '_VideoControllerBase.recommendedState', context: context);

  @override
  LoadState get recommendedState {
    _$recommendedStateAtom.reportRead();
    return super.recommendedState;
  }

  @override
  set recommendedState(LoadState value) {
    _$recommendedStateAtom.reportWrite(value, super.recommendedState, () {
      super.recommendedState = value;
    });
  }

  late final _$getVideoAsyncAction =
      AsyncAction('_VideoControllerBase.getVideo', context: context);

  @override
  Future<void> getVideo() {
    return _$getVideoAsyncAction.run(() => super.getVideo());
  }

  late final _$getRecommendedVideosAsyncAction = AsyncAction(
      '_VideoControllerBase.getRecommendedVideos',
      context: context);

  @override
  Future<void> getRecommendedVideos() {
    return _$getRecommendedVideosAsyncAction
        .run(() => super.getRecommendedVideos());
  }

  late final _$_VideoControllerBaseActionController =
      ActionController(name: '_VideoControllerBase', context: context);

  @override
  void _setIsFavorite(bool value) {
    final _$actionInfo = _$_VideoControllerBaseActionController.startAction(
        name: '_VideoControllerBase._setIsFavorite');
    try {
      return super._setIsFavorite(value);
    } finally {
      _$_VideoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _changeVideoLoadState(LoadState state) {
    final _$actionInfo = _$_VideoControllerBaseActionController.startAction(
        name: '_VideoControllerBase._changeVideoLoadState');
    try {
      return super._changeVideoLoadState(state);
    } finally {
      _$_VideoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _changeRecommendedState(LoadState state) {
    final _$actionInfo = _$_VideoControllerBaseActionController.startAction(
        name: '_VideoControllerBase._changeRecommendedState');
    try {
      return super._changeRecommendedState(state);
    } finally {
      _$_VideoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
video: ${video},
relatedVideos: ${relatedVideos},
isFavorite: ${isFavorite},
videoLoadState: ${videoLoadState},
recommendedState: ${recommendedState}
    ''';
  }
}
