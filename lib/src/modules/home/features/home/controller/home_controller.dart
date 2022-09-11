// ignore_for_file: library_private_types_in_public_api

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:rarovideowall/src/modules/home/features/home/model/play_list_content.dart';
import 'package:rarovideowall/src/modules/home/home_route_names.dart';
import 'package:rarovideowall/src/modules/login_module/login_route_names.dart';

import 'package:rarovideowall/src/modules_route_names.dart';
import 'package:rarovideowall/src/shared/constants/app_colors.dart';
import 'package:rarovideowall/src/shared/constants/keys_storage.dart';
import 'package:rarovideowall/src/shared/constants/load_states.dart';
import 'package:rarovideowall/src/shared/constants/show_popups.dart';
import 'package:rarovideowall/src/shared/global_states/logged_state/logged_state.dart';
import 'package:rarovideowall/src/shared/global_states/videos_state/videos_state.dart';
import 'package:rarovideowall/src/shared/interfaces/login_repository_interface.dart';
import 'package:rarovideowall/src/shared/interfaces/videos_repository_interface.dart';
import 'package:rarovideowall/src/shared/models/failure.dart';
import 'package:rarovideowall/src/shared/models/user_model.dart';
import 'package:rarovideowall/src/shared/models/video_model.dart';
import 'package:rarovideowall/src/shared/repositories/local_storage_video_repository.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final LoggedState loggedState;
  final VideosState videosState;
  final IVideosRepository videosRepository;
  final ILoginRepository loginRepository;
  final LocalStorageVideoRepository localStorageVideoRepository;

  _HomeControllerBase({
    required this.loggedState,
    required this.videosState,
    required this.videosRepository,
    required this.loginRepository,
    required this.localStorageVideoRepository,
  });

  bool get isLogged => loggedState.isLogged;

  UserModel? get user => loggedState.user;

  List<VideoModel> get favoriteVideos => videosState.favoriteVideos;

  List<VideoModel> get videos => videosState.videos;

  List<VideoModel> get historyVideos => videosState.history;

  @observable
  bool hasImgAvatarError = false;

  @observable
  Playlist playlistOption = Playlist.all;

  @observable
  LoadState homeState = LoadState.success;

  @observable
  String errorText = '';

  @action
  void onLoadImgError(BuildContext context) {
    hasImgAvatarError = true;
    ShowPopups.showSnackBar(
      context,
      'Houve um problema ao carregar a imagem de usuário.',
      AppColors.errorColor,
    );
  }

  @action
  void setPlaylistOption(Playlist option) => playlistOption = option;

  @action
  void setHomeState(Either<Failure, LoadState> newStateEither) {
    newStateEither.fold(
      (fail) {
        homeState = LoadState.error;
        errorText = fail.message;
      },
      (state) => homeState = state,
    );
  }

  Future<void> refreshVideos() async {
    setHomeState(const Right(LoadState.loading));
    (await videosRepository.getAllVideos()).fold(
      (fail) => setHomeState(Left(fail)),
      (success) async {
        if (isLogged) {
          (await videosRepository.getFavoriteVideos()).fold(
            (fail) => setHomeState(Left(fail)),
            (success) => setHomeState(const Right(LoadState.success)),
          );
        } else {
          setHomeState(const Right(LoadState.success));
        }
      },
    );
  }

  Future<void> loginNavigate() async {
    await Modular.to.pushNamed(ModulesRouteNames.loginModule);
    if (isLogged) {
      refreshVideos();
    }
  }

  Future<void> logoutAction() async {
    loginRepository.logout();
    refreshVideos();
  }

  void detailsNavigate(VideoModel video) {
    Modular.to.pushNamed(HomeRouteNames.details(video.id));
    localStorageVideoRepository.save(KeysStorage.history, video);
  }

  void registerNavigate() {
    Modular.to.pushNamed(
        '${ModulesRouteNames.loginModule}${LoginRouteNames.register}');
  }

  List<PlayListContent> createPlayList() {
    final publicRegExp = RegExp(
      r'aul[aã]o',
      caseSensitive: false,
    );
    final weekRegExp = RegExp(
      r'semana[\s]?\d+',
      caseSensitive: false,
    );

    List<VideoModel> publicVideos = [];

    List<VideoModel> classVideos = [];

    List<VideoModel> weekVideos = [];

    for (VideoModel video in videos) {
      if (video.tags.any((tag) => tag.contains(publicRegExp)) ||
          video.url.contains('youtube')) {
        publicVideos.add(video);
      } else if (video.topic.contains(weekRegExp)) {
        weekVideos.add(video);
      } else {
        classVideos.add(video);
      }
    }

    return _filterPlayList(publicVideos, classVideos, weekVideos);
  }

  List<PlayListContent> _filterPlayList(
    List<VideoModel> publicVideos,
    List<VideoModel> classVideos,
    List<VideoModel> weekVideos,
  ) {
    switch (playlistOption) {
      case Playlist.all:
        return [
          PlayListContent(
            name: 'Últimos Vistos',
            videos: historyVideos.reversed.toList().sublist(
                  historyVideos.length > 5 ? 5 : historyVideos.length,
                ),
          ),
          PlayListContent(name: 'Públicos', videos: publicVideos),
          PlayListContent(name: 'Minha Turma', videos: classVideos),
          ..._weekVideosPlayList(weekVideos),
        ];
      case Playlist.classVideos:
        return [
          PlayListContent(name: 'Minha Turma', videos: classVideos),
        ];
      case Playlist.favorites:
        return [];
      case Playlist.historic:
        return [PlayListContent(name: 'Últimos Vistos', videos: historyVideos)];
      case Playlist.public:
        return [PlayListContent(name: 'Públicos', videos: publicVideos)];
      case Playlist.weeks:
        return [
          ..._weekVideosPlayList(weekVideos),
        ];
    }
  }

  List<PlayListContent> _weekVideosPlayList(List<VideoModel> weekVideos) {
    List<PlayListContent> weekPlayList = [];
    int week = 1;
    while (weekVideos.isNotEmpty) {
      weekPlayList.add(
        PlayListContent(
          name: 'Semana ${week.toString().padLeft(2, '0')}',
          videos: weekVideos
              .where(
                (video) => video.topic.contains(
                  RegExp(
                    r'semana[\s]?[0]*' '${week.toString()}',
                    caseSensitive: false,
                  ),
                ),
              )
              .toList(),
        ),
      );
      weekVideos.retainWhere(
        (video) => !weekPlayList[week - 1].videos.contains(video),
      );
      week++;
    }

    return weekPlayList;
  }
}

enum Playlist { all, favorites, public, classVideos, weeks, historic }
