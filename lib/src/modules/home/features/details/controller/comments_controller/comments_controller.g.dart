// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CommentsController on _CommentsControllerBase, Store {
  late final _$commentsStateAtom =
      Atom(name: '_CommentsControllerBase.commentsState', context: context);

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

  late final _$commentsAtom =
      Atom(name: '_CommentsControllerBase.comments', context: context);

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
      Atom(name: '_CommentsControllerBase.hasImgAvatarError', context: context);

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

  late final _$isEditModeAtom =
      Atom(name: '_CommentsControllerBase.isEditMode', context: context);

  @override
  bool get isEditMode {
    _$isEditModeAtom.reportRead();
    return super.isEditMode;
  }

  @override
  set isEditMode(bool value) {
    _$isEditModeAtom.reportWrite(value, super.isEditMode, () {
      super.isEditMode = value;
    });
  }

  late final _$getCommentsAsyncAction =
      AsyncAction('_CommentsControllerBase.getComments', context: context);

  @override
  Future<void> getComments() {
    return _$getCommentsAsyncAction.run(() => super.getComments());
  }

  late final _$_CommentsControllerBaseActionController =
      ActionController(name: '_CommentsControllerBase', context: context);

  @override
  void _changeCommentsState(LoadState state) {
    final _$actionInfo = _$_CommentsControllerBaseActionController.startAction(
        name: '_CommentsControllerBase._changeCommentsState');
    try {
      return super._changeCommentsState(state);
    } finally {
      _$_CommentsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void enterEditMode(CommentModel comment) {
    final _$actionInfo = _$_CommentsControllerBaseActionController.startAction(
        name: '_CommentsControllerBase.enterEditMode');
    try {
      return super.enterEditMode(comment);
    } finally {
      _$_CommentsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void exitEditMode() {
    final _$actionInfo = _$_CommentsControllerBaseActionController.startAction(
        name: '_CommentsControllerBase.exitEditMode');
    try {
      return super.exitEditMode();
    } finally {
      _$_CommentsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _updateCommentVote(String commentId, bool isUp) {
    final _$actionInfo = _$_CommentsControllerBaseActionController.startAction(
        name: '_CommentsControllerBase._updateCommentVote');
    try {
      return super._updateCommentVote(commentId, isUp);
    } finally {
      _$_CommentsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
commentsState: ${commentsState},
comments: ${comments},
hasImgAvatarError: ${hasImgAvatarError},
isEditMode: ${isEditMode}
    ''';
  }
}
