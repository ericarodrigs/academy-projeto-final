// ignore_for_file: library_private_types_in_public_api

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:rarovideowall/src/modules/home/features/details/model/comment_model.dart';

import 'package:rarovideowall/src/modules/home/interfaces/comment_repository_interface.dart';
import 'package:rarovideowall/src/shared/constants/app_colors.dart';
import 'package:rarovideowall/src/shared/constants/load_states.dart';
import 'package:rarovideowall/src/shared/constants/show_popups.dart';
import 'package:rarovideowall/src/shared/global_states/logged_state/logged_state.dart';

part 'comments_controller.g.dart';

class CommentsController = _CommentsControllerBase with _$CommentsController;

abstract class _CommentsControllerBase with Store {
  final TextEditingController textController = TextEditingController();
  final GlobalKey<FormState> commentsKey = GlobalKey<FormState>();
  String commentsError = '';
  String _editCommentId = '';
  String _videoId = '';
  final List<String> _upVoteComments = [];
  final List<String> _downVoteComments = [];
  final FocusNode focusNode = FocusNode();

  final ICommentRepository _commentRepository;
  final LoggedState _loggedState;
  _CommentsControllerBase({
    required ICommentRepository commentRepository,
    required LoggedState loggedState,
  })  : _commentRepository = commentRepository,
        _loggedState = loggedState;

  bool get isLogged => _loggedState.isLogged;
  String get userId => _loggedState.user?.id ?? '';

  void initState(String videoId) {
    _videoId = videoId;
    getComments();
  }

  @observable
  LoadState commentsState = LoadState.loading;

  @observable
  ObservableList<CommentModel> comments = ObservableList.of([]);

  @observable
  bool hasImgAvatarError = false;

  @observable
  bool isEditMode = false;

  @action
  void _changeCommentsState(LoadState state) => commentsState = state;

  @action
  void enterEditMode(CommentModel comment) {
    isEditMode = true;
    focusNode.requestFocus();
    textController.text = comment.text.trim();
    textController.selection = TextSelection.fromPosition(
      TextPosition(
        offset: textController.text.length,
      ),
    );
    _editCommentId = comment.id;
  }

  @action
  void exitEditMode() {
    if (isEditMode) {
      textController.clear();
      isEditMode = false;
    }
  }

  @action
  Future<void> getComments() async {
    _changeCommentsState(LoadState.loading);
    (await _commentRepository.getComments(_videoId)).fold(
      (fail) {
        _changeCommentsState(LoadState.error);
        commentsError = fail.message;
      },
      (newComments) {
        comments = ObservableList.of(newComments);
        _changeCommentsState(LoadState.success);
      },
    );
  }

  @action
  void _updateCommentVote(String commentId, bool isUp) {
    int indexComment = comments.indexWhere(
      (comment) => comment.id == commentId,
    );
    CommentModel auxComment = comments[indexComment];

    bool isFirst = !(_upVoteComments.contains(auxComment.id) ||
        _downVoteComments.contains(auxComment.id));

    if (isUp) {
      if (!_upVoteComments.contains(auxComment.id)) {
        _upVoteComments.add(auxComment.id);
        _downVoteComments.remove(auxComment.id);
        comments[indexComment] = auxComment.copyWith(
          upVotes: auxComment.upVotes + 1,
          downVotes: isFirst
              ? auxComment.downVotes
              : auxComment.downVotes == 0
                  ? 0
                  : auxComment.downVotes - 1,
        );
      }
    } else {
      if (!_downVoteComments.contains(auxComment.id)) {
        _downVoteComments.add(auxComment.id);
        _upVoteComments.remove(auxComment.id);
        comments[indexComment] = auxComment.copyWith(
          upVotes: isFirst
              ? auxComment.upVotes
              : auxComment.upVotes == 0
                  ? 0
                  : auxComment.upVotes - 1,
          downVotes: auxComment.downVotes + 1,
        );
      }
    }
  }

  void editComment(BuildContext context) async {
    if (commentsKey.currentState?.validate() ?? false) {
      (await _commentRepository.editComment(
        _videoId,
        _editCommentId,
        textController.text,
      ))
          .fold(
        (fail) {
          _showSnackBarError(context, fail.message);
        },
        (comment) => getComments(),
      );
      exitEditMode();
    }
  }

  Future<void> sendComment(BuildContext context) async {
    if (commentsKey.currentState?.validate() ?? false) {
      (await _commentRepository.postComment(_videoId, textController.text))
          .fold(
        (fail) => _showSnackBarError(context, fail.message),
        (comment) {
          getComments();
          textController.clear();
        },
      );
    }
  }

  void onLoadImgAvatarError(
      BuildContext context, Object? err, StackTrace? stackTrace) {
    log(err.toString());
    if (!hasImgAvatarError) {
      _showSnackBarError(
        context,
        'Houve um erro ao carregar as imagens dos usuários.',
      );
    }
    hasImgAvatarError = true;
  }

  void deleteComment(BuildContext context, CommentModel comment) {
    FocusScope.of(context).unfocus();
    ShowPopups.showDeleteAlertDialog(
      context,
      () async {
        exitEditMode();
        Modular.to.pop();
        int index = comments.indexOf(comment);
        comments.remove(comment);
        (await _commentRepository.deleteComment(_videoId, comment.id)).fold(
          (fail) {
            comments.insert(index, comment);
            _showSnackBarError(
                context, 'Houve um erro ao deletar o comentário.');
          },
          (success) => null,
        );
      },
      () {
        Modular.to.pop();
      },
      content:
          'Tem certeza que deseja deletar o comentário: \n ${comment.text}',
    );
  }

  Future<void> voteComment(
      BuildContext context, String commentId, bool isUp) async {
    if (_loggedState.isLogged) {
      _updateCommentVote(commentId, isUp);
      (await _commentRepository.voteComment(
        _videoId,
        commentId,
        isUpVote: isUp,
      ))
          .fold(
        (fail) {
          _showSnackBarError(context, fail.message);
          _updateCommentVote(commentId, !isUp);
        },
        (success) => null,
      );
    } else {
      return;
    }
  }

  void _showSnackBarError(BuildContext context, String message) {
    ShowPopups.showSnackBar(context, message, AppColors.errorColor);
  }
}
