// ignore_for_file: library_private_types_in_public_api

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'package:rarovideowall/src/modules/home/features/details/model/comment_model.dart';
import 'package:rarovideowall/src/modules/home/features/details/model/comment_repository.dart';
import 'package:rarovideowall/src/shared/constants/app_colors.dart';
import 'package:rarovideowall/src/shared/constants/show_popups.dart';
import 'package:rarovideowall/src/shared/global_states/logged_state/logged_state.dart';
import 'package:rarovideowall/src/shared/global_states/videos_state/videos_state.dart';
import 'package:rarovideowall/src/shared/models/video_model.dart';
import 'package:rarovideowall/src/shared/repositories/videos_repository.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

part 'video_details_controller.g.dart';

class VideoDetailsController = _VideoDetailsController
    with _$VideoDetailsController;

abstract class _VideoDetailsController with Store {
  VideosRepository videosRepository;
  CommentRepository commentRepository;
  LoggedState loggedState;
  VideosState videosState;

  late YoutubePlayerController youtubePlayerController;
  TextEditingController textController = TextEditingController();
  final GlobalKey<FormState> commentsKey = GlobalKey<FormState>();

  String videoId = '';
  String relatedError = '';
  String videoError = '';
  String commentsError = '';
  String _editCommentId = '';

  _VideoDetailsController({
    required this.videosRepository,
    required this.commentRepository,
    required this.loggedState,
    required this.videosState,
  });

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
  bool isFavorite = false;

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
    changeVideoLoadState(LoadState.loading);
    changeRelatedState(LoadState.loading);
    changeCommentsState(LoadState.loading);
    videoId = id;
    getVideo();
    getRecommendedVideos();
    getComments();
    _setIsFavorite(
      videosState.favoriteVideos.any(
        (video) => video.id == videoId,
      ),
    );
  }

  @observable
  bool isEditMode = false;

  @action
  void _setIsFavorite(bool value) => isFavorite = value;

  void favoriteVideo(BuildContext context) async {
    _setIsFavorite(!isFavorite);

    (await videosRepository.toggleFavorite(
      videoId,
      isFavorite: !isFavorite,
    ))
        .fold(
      (fail) {
        _showSnackBarError(context, fail.message);
        _setIsFavorite(!isFavorite);
      },
      (success) => videosRepository.getFavoriteVideos(),
    );
  }

  @action
  void enterEditMode(CommentModel comment) {
    isEditMode = true;
    textController.text = comment.text;
    _editCommentId = comment.id;
  }

  @action
  void exitEditMode() {
    if (isEditMode) {
      textController.clear();
      isEditMode = false;
    }
  }

  void editComment(BuildContext context) async {
    if (commentsKey.currentState?.validate() ?? false) {
      (await commentRepository.editComment(
        videoId,
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
      (await commentRepository.postComment(videoId, textController.text)).fold(
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

  void _showSnackBarError(BuildContext context, String message) {
    ShowPopups.showSnackBar(context, message, AppColors.errorColor);
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
        (await commentRepository.deleteComment(videoId, comment.id)).fold(
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

  final List<String> _upVoteComments = [];
  final List<String> _downVoteComments = [];

  //Revisar essa logica pq ficou muito complexa
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
    (await videosRepository.getVideo(videoId)).fold((fail) {
      changeVideoLoadState(LoadState.error);
      videoError = fail.message;
    }, (videoInfo) {
      video = videoInfo;
      if (getIsYoutube()) {
        initYoutubeController();
      }
      changeVideoLoadState(LoadState.done);
    });
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

  bool getIsYoutube() {
    return video.url.contains('youtube') ? true : false;
  }

  void initYoutubeController() {
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: YoutubePlayerController.convertUrlToId(video.url)!,
      params: const YoutubePlayerParams(
          autoPlay: false, showFullscreenButton: true),
    )
      ..onEnterFullscreen = () {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeRight,
          DeviceOrientation.landscapeLeft,
        ]);
      }
      ..onExitFullscreen = () {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitDown,
          DeviceOrientation.portraitUp,
          DeviceOrientation.landscapeRight,
          DeviceOrientation.landscapeLeft,
        ]);
      };
  }
}

enum LoadState { loading, done, error }
