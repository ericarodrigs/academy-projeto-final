// ignore_for_file: library_private_types_in_public_api

import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:rarovideowall/src/modules/home/features/home/model/play_list_content.dart';
import 'package:rarovideowall/src/modules/home/home_route_names.dart';

import 'package:rarovideowall/src/modules_route_names.dart';
import 'package:rarovideowall/src/shared/global_states/logged_state/logged_state.dart';
import 'package:rarovideowall/src/shared/global_states/videos_state/videos_state.dart';
import 'package:rarovideowall/src/shared/interfaces/login_repository_interface.dart';
import 'package:rarovideowall/src/shared/interfaces/videos_repository_interface.dart';
import 'package:rarovideowall/src/shared/models/failure.dart';
import 'package:rarovideowall/src/shared/models/video_model.dart';
import 'package:rarovideowall/src/shared/repositories/local_storage_user_repository.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final LoggedState loggedState;
  final VideosState videosState;
  final IVideosRepository videosRepository;
  final ILoginRepository loginRepository;
  final LocalStorageUserRepository localStorageUserRepository;

  _HomeControllerBase({
    required this.loggedState,
    required this.videosState,
    required this.videosRepository,
    required this.loginRepository,
    required this.localStorageUserRepository,
  });

  bool get isLogged => loggedState.isLogged;

  List<VideoModel> get favoriteVideos => videosState.favoriteVideos;

  List<VideoModel> get videos => videosState.videos;

  @observable
  HomeState homeState = HomeState.success;

  @observable
  String errorText = '';

  @action
  void setHomeState(Either<Failure, HomeState> newStateEither) {
    newStateEither.fold(
      (fail) {
        homeState = HomeState.fail;
        errorText = fail.message;
      },
      (state) => homeState = state,
    );
  }

  Future<void> refreshVideos() async {
    setHomeState(const Right(HomeState.loading));
    (await videosRepository.getAllVideos()).fold(
      (fail) => setHomeState(Left(fail)),
      (success) async {
        if (isLogged) {
          (await videosRepository.getFavoriteVideos()).fold(
            (fail) => setHomeState(Left(fail)),
            (success) => setHomeState(const Right(HomeState.success)),
          );
        } else {
          setHomeState(const Right(HomeState.success));
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
    localStorageUserRepository.delete();
    refreshVideos();
  }

  void detailsNavigate(VideoModel video) {
    Modular.to.pushNamed(HomeRouteNames.details(video.id));
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
      } else if (video.topico.contains(weekRegExp)) {
        weekVideos.add(video);
      } else {
        classVideos.add(video);
      }
    }

    return [
      PlayListContent(name: 'Públicos', videos: publicVideos),
      PlayListContent(name: 'Minha Turma', videos: classVideos),
      ..._weekVideosPlayList(weekVideos),
    ];
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
                (video) => video.topico.contains(
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

enum HomeState { success, fail, loading }
