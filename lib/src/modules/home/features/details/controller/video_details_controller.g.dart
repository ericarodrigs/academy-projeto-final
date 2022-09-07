// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_details_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VideoDetailsController on _VideoDetailsController, Store {
  late final _$videoAtom =
      Atom(name: '_VideoDetailsController.video', context: context);

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

  late final _$videoLoadStateAtom =
      Atom(name: '_VideoDetailsController.videoLoadState', context: context);

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

  late final _$relatedStateAtom =
      Atom(name: '_VideoDetailsController.relatedState', context: context);

  @override
  LoadState get relatedState {
    _$relatedStateAtom.reportRead();
    return super.relatedState;
  }

  @override
  set relatedState(LoadState value) {
    _$relatedStateAtom.reportWrite(value, super.relatedState, () {
      super.relatedState = value;
    });
  }

  late final _$commentsStateAtom =
      Atom(name: '_VideoDetailsController.commentsState', context: context);

  @override
  LoadState get commentsState {
    _$commentsStateAtom.reportRead();
    return super.commentsState;
  }

  @override
  set commentsState(LoadState value) {
    _$commentsStateAtom.reportWrite(value, super.commentsState, () {
      super.commentsState = value;
    });
  }

  late final _$relatedVideosAtom =
      Atom(name: '_VideoDetailsController.relatedVideos', context: context);

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

  late final _$commentsAtom =
      Atom(name: '_VideoDetailsController.comments', context: context);

  @override
  ObservableList<CommentModel> get comments {
    _$commentsAtom.reportRead();
    return super.comments;
  }

  @override
  set comments(ObservableList<CommentModel> value) {
    _$commentsAtom.reportWrite(value, super.comments, () {
      super.comments = value;
    });
  }

  late final _$hasImgAvatarErrorAtom =
      Atom(name: '_VideoDetailsController.hasImgAvatarError', context: context);

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

  late final _$getCommentsAsyncAction =
      AsyncAction('_VideoDetailsController.getComments', context: context);

  @override
  Future<void> getComments() {
    return _$getCommentsAsyncAction.run(() => super.getComments());
  }

  late final _$getRecommendedVideosAsyncAction = AsyncAction(
      '_VideoDetailsController.getRecommendedVideos',
      context: context);

  @override
  Future<void> getRecommendedVideos() {
    return _$getRecommendedVideosAsyncAction
        .run(() => super.getRecommendedVideos());
  }

  late final _$getVideoAsyncAction =
      AsyncAction('_VideoDetailsController.getVideo', context: context);

  @override
  Future<void> getVideo() {
    return _$getVideoAsyncAction.run(() => super.getVideo());
  }

  late final _$changeVideoLoadStateAsyncAction = AsyncAction(
      '_VideoDetailsController.changeVideoLoadState',
      context: context);

  @override
  Future<void> changeVideoLoadState(LoadState state) {
    return _$changeVideoLoadStateAsyncAction
        .run(() => super.changeVideoLoadState(state));
  }

  late final _$changeRelatedStateAsyncAction = AsyncAction(
      '_VideoDetailsController.changeRelatedState',
      context: context);

  @override
  Future<void> changeRelatedState(LoadState state) {
    return _$changeRelatedStateAsyncAction
        .run(() => super.changeRelatedState(state));
  }

  late final _$changeCommentsStateAsyncAction = AsyncAction(
      '_VideoDetailsController.changeCommentsState',
      context: context);

  @override
  Future<void> changeCommentsState(LoadState state) {
    return _$changeCommentsStateAsyncAction
        .run(() => super.changeCommentsState(state));
  }

  late final _$_VideoDetailsControllerActionController =
      ActionController(name: '_VideoDetailsController', context: context);

  @override
  void _updateCommentVote(String commentId, bool isUp) {
    final _$actionInfo = _$_VideoDetailsControllerActionController.startAction(
        name: '_VideoDetailsController._updateCommentVote');
    try {
      return super._updateCommentVote(commentId, isUp);
    } finally {
      _$_VideoDetailsControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
video: ${video},
videoLoadState: ${videoLoadState},
relatedState: ${relatedState},
commentsState: ${commentsState},
relatedVideos: ${relatedVideos},
comments: ${comments},
hasImgAvatarError: ${hasImgAvatarError}
    ''';
  }
}
