// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'videos_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VideosState on _VideosStateBase, Store {
  late final _$favoriteVideosAtom =
      Atom(name: '_VideosStateBase.favoriteVideos', context: context);

  @override
  List<VideoModel> get favoriteVideos {
    _$favoriteVideosAtom.reportRead();
    return super.favoriteVideos;
  }

  @override
  set favoriteVideos(List<VideoModel> value) {
    _$favoriteVideosAtom.reportWrite(value, super.favoriteVideos, () {
      super.favoriteVideos = value;
    });
  }

  late final _$videosAtom =
      Atom(name: '_VideosStateBase.videos', context: context);

  @override
  List<VideoModel> get videos {
    _$videosAtom.reportRead();
    return super.videos;
  }

  @override
  set videos(List<VideoModel> value) {
    _$videosAtom.reportWrite(value, super.videos, () {
      super.videos = value;
    });
  }

  late final _$_VideosStateBaseActionController =
      ActionController(name: '_VideosStateBase', context: context);

  @override
  void syncFavoriteVideos(List<VideoModel> videos) {
    final _$actionInfo = _$_VideosStateBaseActionController.startAction(
        name: '_VideosStateBase.syncFavoriteVideos');
    try {
      return super.syncFavoriteVideos(videos);
    } finally {
      _$_VideosStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void syncVideos(List<VideoModel> newVideos) {
    final _$actionInfo = _$_VideosStateBaseActionController.startAction(
        name: '_VideosStateBase.syncVideos');
    try {
      return super.syncVideos(newVideos);
    } finally {
      _$_VideosStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
favoriteVideos: ${favoriteVideos},
videos: ${videos}
    ''';
  }
}
