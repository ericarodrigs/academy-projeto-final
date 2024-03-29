// ignore_for_file: library_private_types_in_public_api

import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:rarovideowall/src/modules_route_names.dart';
import 'package:rarovideowall/src/shared/constants/load_states.dart';
import 'package:rarovideowall/src/shared/interfaces/local_storage_user_repository_interface.dart';
import 'package:rarovideowall/src/shared/interfaces/local_storage_video_repository_interface.dart';
import 'package:rarovideowall/src/shared/interfaces/login_repository_interface.dart';
import 'package:rarovideowall/src/shared/interfaces/videos_repository_interface.dart';
import 'package:rarovideowall/src/shared/models/failure.dart';

class SplashController {
  final ILoginRepository loginRepository;
  final ILocalStorageUserRepository localStorageUserRepository;
  final ILocalStorageVideoRepository localStorageVideoRepository;

  final IVideosRepository videosRepository;

  SplashController({
    required this.loginRepository,
    required this.localStorageUserRepository,
    required this.localStorageVideoRepository,
    required this.videosRepository,
  });

  bool _animationIsFinished = false;

  bool _loadIsFinished = false;

  set animationIsFinished(bool value) => _animationIsFinished = value;

  Future<void> tryLocalStorageLogin() async {
    (await localStorageUserRepository.get()).fold(
      (error) => _getAllVideos(),
      (loginUserModel) async =>
          (await loginRepository.login(loginUserModel)).fold(
        (error) => _getAllVideos(),
        (success) => {
          _syncLoggedVideos(),
          _syncHistoryVideos(),
          _getAllVideos(),
        },
      ),
    );
  }

  void _getAllVideos() async => (await videosRepository.getAllVideos()).fold(
        _failStateNavigate,
        (success) async {
          _loadIsFinished = true;
          tryNavigate();
        },
      );

  void _syncHistoryVideos() async =>
      (await localStorageVideoRepository.loadAll()).fold(
        _failStateNavigate,
        (success) => null,
      );

  void _syncLoggedVideos() async =>
      (await videosRepository.getFavoriteVideos()).fold(
        _failStateNavigate,
        (success) => null,
      );

  void _failStateNavigate(Failure fail) => Modular.to.pushReplacementNamed(
        ModulesRouteNames.homeModule,
        arguments: Left<Failure, LoadState>(fail),
      );

  void tryNavigate() {
    if (_loadIsFinished && _animationIsFinished) {
      Modular.to.pushReplacementNamed(
        ModulesRouteNames.homeModule,
        arguments: const Right<Failure, LoadState>(LoadState.success),
      );
    }
  }
}
