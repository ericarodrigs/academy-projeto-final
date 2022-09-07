// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
import 'package:rarovideowall/src/shared/models/video_model.dart';
import 'package:rarovideowall/src/shared/repositories/videos_repository.dart';

part 'video_details_controller.g.dart';

class VideoDetailsController = _VideoDetailsController
    with _$VideoDetailsController;

abstract class _VideoDetailsController with Store {
  VideosRepository videosRepository;

  _VideoDetailsController({required this.videosRepository});

  String videoId = '';

  String relatedError = '';

  String videoError = '';

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
  List<VideoModel> relatedVideos = [];

  void initializePageInfo(String id) {
    videoId = id;
    getVideo();
    getRecommendedVideos();
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
}

enum LoadState { loading, done, error }
