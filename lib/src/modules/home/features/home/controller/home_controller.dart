// ignore_for_file: library_private_types_in_public_api

import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'package:rarovideowall/src/modules_route_names.dart';
import 'package:rarovideowall/src/shared/global_states/logged_state/logged_state.dart';
import 'package:rarovideowall/src/shared/global_states/videos_state/videos_state.dart';
import 'package:rarovideowall/src/shared/models/failure.dart';
import 'package:rarovideowall/src/shared/models/video_model.dart';
import 'package:rarovideowall/src/shared/repositories/login_repository.dart';
import 'package:rarovideowall/src/shared/repositories/videos_repository.dart';
import 'package:rarovideowall/src/w_system/organisms/w_favorite_video_list.dart';
import 'package:rarovideowall/src/w_system/organisms/w_title_video_list.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  LoggedState loggedState;
  VideosState videosState;
  VideosRepository videosRepository;
  LoginRepository loginRepository;

  _HomeControllerBase({
    required this.loggedState,
    required this.videosState,
    required this.videosRepository,
    required this.loginRepository,
  });

  bool get isLogged => loggedState.isLogged;

  List<VideoModel> get favoriteVideos => videosState.favoriteVideos;

  List<VideoModel> get videos => videosState.videos;

  @observable
  HomeState homeState = HomeState.success;

  @action
  void setHomeState(Either<Failure, HomeState> newStateEither) {
    newStateEither.fold(
      (fail) => homeState = HomeState.fail,
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
    refreshVideos();
  }

  Future<void> logoutAction() async {
    loginRepository.logout();
    refreshVideos();
  }

  void detailsNavigate(VideoModel video) {
    Modular.to.pushNamed('details/${video.id}');
  }

  List<WTitleVideoList> get playListWidget {
    List<WTitleVideoList> playListWidget = [];
    if (isLogged) {
      List<PlayListContent> playList = _createPlayList();
      playListWidget.add(WFavoriteVideoList(
        onTap: detailsNavigate,
        videos: favoriteVideos,
      ));
      playListWidget.addAll(
        List.generate(
          playList.length,
          (index) => WTitleVideoList(
            onTap: detailsNavigate,
            title: playList[index].name,
            videos: playList[index].videos,
          ),
        ),
      );
    } else {
      playListWidget.add(WTitleVideoList(
        onTap: detailsNavigate,
        title: 'Públicos',
        videos: videos,
      ));
    }
    return playListWidget;
  }

  List<PlayListContent> _createPlayList() {
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
      if (video.tags.any((tag) => tag.contains(publicRegExp))) {
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

class PlayListContent {
  final String name;
  final List<VideoModel> videos;
  PlayListContent({
    required this.name,
    required this.videos,
  });
}

enum HomeState { success, fail, loading }
