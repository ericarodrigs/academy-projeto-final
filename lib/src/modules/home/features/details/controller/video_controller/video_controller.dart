// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import 'package:rarovideowall/src/shared/constants/app_colors.dart';
import 'package:rarovideowall/src/shared/constants/show_popups.dart';
import 'package:rarovideowall/src/shared/global_states/logged_state/logged_state.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import 'package:rarovideowall/src/shared/constants/load_states.dart';
import 'package:rarovideowall/src/shared/global_states/videos_state/videos_state.dart';
import 'package:rarovideowall/src/shared/interfaces/videos_repository_interface.dart';
import 'package:rarovideowall/src/shared/models/video_model.dart';

part 'video_controller.g.dart';

class VideoController = _VideoControllerBase with _$VideoController;

abstract class _VideoControllerBase with Store {
  String _videoId = '';
  String recommendedError = '';
  String videoError = '';
  late YoutubePlayerController youtubePlayerController;

  final LoggedState _loggedState;
  final IVideosRepository _videosRepository;
  final VideosState _videosState;
  _VideoControllerBase({
    required IVideosRepository videosRepository,
    required VideosState videosState,
    required LoggedState loggedState,
  })  : _videosRepository = videosRepository,
        _videosState = videosState,
        _loggedState = loggedState;

  bool get isLogged => _loggedState.isLogged;

  void initState(String videoId) {
    _videoId = videoId;
    getVideo();
    getRecommendedVideos();
    _setIsFavorite(
      _videosState.favoriteVideos.any(
        (video) => video.id == _videoId,
      ),
    );
  }

  @observable
  VideoModel video = VideoModel(
      publicationDate: '',
      id: '',
      description: '',
      tags: [],
      name: '',
      duration: '',
      createdAt: '',
      topic: '',
      thumbUrl: '',
      url: '');

  @observable
  List<VideoModel> relatedVideos = [];

  @observable
  bool isFavorite = false;

  @observable
  LoadState videoLoadState = LoadState.loading;

  @observable
  LoadState recommendedState = LoadState.loading;

  @action
  void _setIsFavorite(bool value) => isFavorite = value;

  @action
  void _changeVideoLoadState(LoadState state) => videoLoadState = state;

  @action
  void _changeRecommendedState(LoadState state) => recommendedState = state;

  @action
  Future<void> getVideo() async {
    _changeVideoLoadState(LoadState.loading);
    (await _videosRepository.getVideo(_videoId)).fold((fail) {
      _changeVideoLoadState(LoadState.error);
      videoError = fail.message;
    }, (videoInfo) {
      video = videoInfo;
      if (isYoutube) {
        _initYoutubeController();
      }
      _changeVideoLoadState(LoadState.success);
    });
  }

  @action
  Future<void> getRecommendedVideos() async {
    _changeRecommendedState(LoadState.loading);
    (await _videosRepository.getRecommendedVideos(_videoId)).fold(
      (fail) {
        _changeRecommendedState(LoadState.error);
        recommendedError = fail.message;
      },
      (videos) {
        relatedVideos = videos;
        _changeRecommendedState(LoadState.success);
      },
    );
  }

  void favoriteVideo(BuildContext context) async {
    _setIsFavorite(!isFavorite);

    (await _videosRepository.toggleFavorite(
      _videoId,
      isFavorite: !isFavorite,
    ))
        .fold(
      (fail) {
        _showSnackBarError(context, fail.message);
        _setIsFavorite(!isFavorite);
      },
      (success) => _videosRepository.getFavoriteVideos(),
    );
  }

  void _initYoutubeController() {
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

  bool get isYoutube => video.url.contains('youtube');

  void _showSnackBarError(BuildContext context, String message) {
    ShowPopups.showSnackBar(context, message, AppColors.errorColor);
  }
}
