// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
import 'package:rarovideowall/src/shared/models/video_model.dart';
part 'videos_state.g.dart';

class VideosState extends _VideosStateBase with _$VideosState {
  VideosState._();
  static final VideosState _instance = VideosState._();
  static VideosState get instance => _instance;
}

abstract class _VideosStateBase with Store {
  @observable
  List<VideoModel> favoriteVideos = [];

  @observable
  List<VideoModel> videos = [];

  @action
  void syncFavoriteVideos(List<VideoModel> videos) => favoriteVideos = videos;

  @action
  void syncVideos(List<VideoModel> newVideos) => videos = newVideos;
}
