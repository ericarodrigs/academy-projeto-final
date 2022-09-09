// ignore_for_file: library_private_types_in_public_api

import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:rarovideowall/src/modules/home/features/home/controller/home_controller.dart';

import 'package:rarovideowall/src/modules/splash_module/interfaces/splash_controller_interface.dart';
import 'package:rarovideowall/src/modules_route_names.dart';

import 'package:rarovideowall/src/shared/interfaces/login_repository_interface.dart';
import 'package:rarovideowall/src/shared/interfaces/videos_repository_interface.dart';

import 'package:rarovideowall/src/shared/models/failure.dart';
import 'package:rarovideowall/src/shared/repositories/local_storage_user_repository.dart';

class SplashController implements ISplashController {
  final ILoginRepository loginRepository;
  final LocalStorageUserRepository localStorageUserRepository;

  final IVideosRepository videosRepository;

  SplashController({
    required this.loginRepository,
    required this.localStorageUserRepository,
    required this.videosRepository,
  });

  @override
  Future<void> tryLocalStorageLogin() async {
    (await localStorageUserRepository.get()).fold(
      (error) => _getAllVideos(),
      (loginUserModel) async =>
          (await loginRepository.login(loginUserModel)).fold(
        (error) => _getAllVideos(),
        (success) => {
          _syncLoggedVideos(),
          _getAllVideos(),
        },
      ),
    );
  }

  void _getAllVideos() async => (await videosRepository.getAllVideos()).fold(
        _failStateNavigate,
        (success) => Modular.to.pushReplacementNamed(
          ModulesRouteNames.homeModule,
          arguments: const Right<Failure, HomeState>(HomeState.success),
        ),
      );

  void _syncLoggedVideos() async =>
      (await videosRepository.getFavoriteVideos()).fold(
        _failStateNavigate,
        (success) => null,
      );

  void _failStateNavigate(Failure fail) => Modular.to.pushReplacementNamed(
        ModulesRouteNames.homeModule,
        arguments: Left<Failure, HomeState>(fail),
      );
}
