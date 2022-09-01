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
    (await videosRepository.getAll()).fold(
      (fail) => setHomeState(Left(fail)),
      (success) => setHomeState(const Right(HomeState.success)),
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
}

enum HomeState { success, fail, loading }
