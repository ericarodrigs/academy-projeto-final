import 'package:mobx/mobx.dart';
import 'package:rarovideowall/src/shared/models/video_model.dart';
import 'package:rarovideowall/src/shared/repositories/videos_repository.dart';

part 'video_details_controller.g.dart';

class VideoDetailsController = _VideoDetailsController with _$VideoDetailsController;

abstract class _VideoDetailsController with Store {
  late Future<void> initializeVideoPlayerFuture;
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

  @action
  Future<void> getRelatedVideos() async {
    changeRelatedState(LoadState.loading);
    var response = await videosRepository.getRecommendedVideos(video.id);
    response.fold((l) => {changeRelatedState(LoadState.error), relatedError = l.message},
        (r) => {r.removeWhere((e) => e.id == videoId), relatedVideos = r, changeRelatedState(LoadState.done)});
  }

  @action
  Future<void> getVideo() async {
    changeVideoLoadState(LoadState.loading);
    var response = await videosRepository.getVideo(videoId);
    response.fold((l) => {changeVideoLoadState(LoadState.error), videoError = l.message}, (r) => {video = r});
    changeVideoLoadState(LoadState.done);
    getRelatedVideos();
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