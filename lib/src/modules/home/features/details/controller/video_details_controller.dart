// ignore_for_file: library_private_types_in_public_api

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:rarovideowall/src/modules/home/features/details/model/comment_model.dart';

import 'package:rarovideowall/src/modules/home/features/details/model/comment_repository.dart';
import 'package:rarovideowall/src/shared/constants/app_colors.dart';
import 'package:rarovideowall/src/shared/constants/app_text_styles.dart';
import 'package:rarovideowall/src/shared/constants/show_popups.dart';
import 'package:rarovideowall/src/shared/global_states/logged_state/logged_state.dart';
import 'package:rarovideowall/src/shared/models/video_model.dart';
import 'package:rarovideowall/src/shared/repositories/videos_repository.dart';

part 'video_details_controller.g.dart';

class VideoDetailsController = _VideoDetailsController
    with _$VideoDetailsController;

abstract class _VideoDetailsController with Store {
  VideosRepository videosRepository;
  CommentRepository commentRepository;
  LoggedState loggedState;

  _VideoDetailsController({
    required this.videosRepository,
    required this.commentRepository,
    required this.loggedState,
  });

  String videoId = '';

  String relatedError = '';

  String videoError = '';

  String commentsError = '';

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @observable
  VideoModel video = VideoModel(
      dataPublicacao: '',
      id: '',
      descricao: '',
      tags: [],
      nome: '',
      duracao: '',
      createdAt: '',
      topico: '',
      thumbUrl: '',
      url: '');

  @observable
  LoadState videoLoadState = LoadState.loading;

  @observable
  LoadState relatedState = LoadState.loading;

  @observable
  LoadState commentsState = LoadState.loading;

  @observable
  List<VideoModel> relatedVideos = [];

  @observable
  ObservableList<CommentModel> comments = ObservableList.of([]);

  @observable
  bool hasImgAvatarError = false;

  void initializePageInfo(String id) {
    videoId = id;
    getVideo();
    getRecommendedVideos();
    getComments();
  }

  late final _$getRecommendedVideosAsyncAction = AsyncAction(
      '_VideoDetailsController.getRecommendedVideos',
      context: context);

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

  void _showSnackBarError(BuildContext context, String message) {
    ShowPopups.showSnackBar(context, message, AppColors.errorColor);
  }

  void deleteComment(BuildContext context, CommentModel comment) {
    ShowPopups.showDeleteAlertDialog(
      context,
      () async {
        int index = comments.indexOf(comment);
        comments.remove(comment);
        (await commentRepository.deleteComment(videoId, comment.id)).fold(
          (fail) {
            comments.insert(index, comment);
            _showSnackBarError(
                context, 'Houve um erro ao deletar o comentário.');
          },
          (success) => null,
        );
        Modular.to.pop();
      },
      () {
        Modular.to.pop();
      },
      content:
          'Tem certeza que deseja deletar o comentário: \n ${comment.texto}',
    );
  }

  final List<String> _upVoteComments = [];
  final List<String> _downVoteComments = [];
  //Revisar essa logica pq ficou muito complexa
  @action
  void _updateCommentVote(String commentId, bool isUp) {
    int indexComment = comments.indexWhere(
      (comment) => comment.id == commentId,
    );
    CommentModel auxComment = comments[indexComment];

    if (isUp) {
      if (!_upVoteComments.contains(auxComment.id)) {
        _upVoteComments.add(auxComment.id);
        _downVoteComments.remove(auxComment.id);
        comments[indexComment] = auxComment.copyWith(
          upVotes: auxComment.upVotes + 1,
          downVotes: auxComment.downVotes == 0 ? 0 : auxComment.downVotes - 1,
        );
      }
    } else {
      if (!_downVoteComments.contains(auxComment.id)) {
        _downVoteComments.add(auxComment.id);
        _upVoteComments.remove(auxComment.id);
        comments[indexComment] = auxComment.copyWith(
          upVotes: auxComment.upVotes == 0 ? 0 : auxComment.upVotes - 1,
          downVotes: auxComment.downVotes + 1,
        );
      }
    }
  }

  Future<void> voteComment(
      BuildContext context, String commentId, bool isUp) async {
    if (loggedState.isLogged) {
      _updateCommentVote(commentId, isUp);
      (await commentRepository.voteComment(
        videoId,
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

  @action
  Future<void> getComments() async {
    changeCommentsState(LoadState.loading);
    (await commentRepository.getComments(videoId)).fold(
      (fail) {
        changeCommentsState(LoadState.error);
        commentsError = fail.message;
      },
      (newComments) {
        comments = ObservableList.of(newComments);
        changeCommentsState(LoadState.done);
      },
    );
  }

  @action
  Future<void> getRecommendedVideos() async {
    changeRelatedState(LoadState.loading);
    (await videosRepository.getRecommendedVideos(videoId)).fold(
      (fail) {
        changeRelatedState(LoadState.error);
        relatedError = fail.message;
      },
      (videos) {
        relatedVideos = videos;
        changeRelatedState(LoadState.done);
      },
    );
  }

  @action
  Future<void> getVideo() async {
    changeVideoLoadState(LoadState.loading);
    (await videosRepository.getVideo(videoId)).fold(
      (fail) {
        changeVideoLoadState(LoadState.error);
        videoError = fail.message;
      },
      (videoInfo) {
        video = videoInfo;
        changeVideoLoadState(LoadState.done);
      },
    );
  }

  @action
  Future<void> changeVideoLoadState(LoadState state) async {
    videoLoadState = state;
  }

  @action
  Future<void> changeRelatedState(LoadState state) async {
    relatedState = state;
  }

  @action
  Future<void> changeCommentsState(LoadState state) async {
    commentsState = state;
  }
}

enum LoadState { loading, done, error }
