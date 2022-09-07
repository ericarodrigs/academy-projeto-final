// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:rarovideowall/src/modules/home/features/details/model/comment_model.dart';

import 'package:rarovideowall/src/modules/home/features/details/model/comment_repository.dart';
import 'package:rarovideowall/src/shared/constants/app_colors.dart';
import 'package:rarovideowall/src/shared/constants/app_text_styles.dart';
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
  List<CommentModel> comments = [];

  @observable
  bool hasImgAvatarError = false;

  void initializePageInfo(String id) {
    videoId = id;
    getVideo();
    getRecommendedVideos();
    getComments();
  }

  void onLoadImgAvatarError(_, __) {
    hasImgAvatarError = true;
    showSnackBarError('Houve um erro ao carregar as imagens.');
  }

  SnackBar snackBarError = const SnackBar(
    backgroundColor: AppColors.errorColor,
    content: Text(
      'Teste',
      style: TextStyles.white14BoldUrbanist,
    ),
  );
  void showSnackBarError(String message) {
    ScaffoldMessengerState().showSnackBar(snackBarError);
  }

  @action
  void _updateCommentVote(String commentId, bool isUp) {
    // ignore: avoid_function_literals_in_foreach_calls
    List<CommentModel> auxComments = comments.map(
      (comment) {
        if (comment.id == commentId) {
          if (isUp) {
            return comment.copyWith(
              upVotes: comment.upVotes > 1 ? comment.upVotes : 1,
              downVotes: comment.downVotes > 1 ? comment.downVotes : 0,
            );
          } else {
            return comment.copyWith(
              upVotes: comment.upVotes > 1 ? comment.upVotes : 0,
              downVotes: comment.downVotes > 1 ? comment.downVotes : 1,
            );
          }
        } else {
          return comment;
        }
      },
    ).toList();
    comments = auxComments;
  }

  Future<void> voteComment(String commentId, bool isUp) async {
    if (loggedState.isLogged) {
      _updateCommentVote(commentId, isUp);
      (await commentRepository.voteComment(
        videoId,
        commentId,
        isUpVote: isUp,
      ))
          .fold(
        (fail) {
          showSnackBarError(fail.message);
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
        comments = newComments;
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
