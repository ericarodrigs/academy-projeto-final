import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rarovideowall/src/modules/home/features/home/controller/home_controller.dart';

import 'package:rarovideowall/src/modules/splash_module/interfaces/splash_controller_interface.dart';
import 'package:rarovideowall/src/modules_route_names.dart';
import 'package:rarovideowall/src/shared/interfaces/login_repository_interface.dart';
import 'package:rarovideowall/src/shared/interfaces/videos_repository_interface.dart';

import 'package:rarovideowall/src/shared/models/failure.dart';
import 'package:rarovideowall/src/shared/repositories/local_storage_user_repository.dart';

class SplashController implements ISplashController {
  final LocalStorageUserRepository localStorageUserRepository;
  final ILoginRepository loginRepository;
  final IVideosRepository videosRepository;

  SplashController({
    required this.localStorageUserRepository,
    required this.loginRepository,
    required this.videosRepository,
  });

  @override
  Future<void> tryLocalStorageLogin() async {
    (await localStorageUserRepository.get()).fold(
      (error) {},
      (userLogin) async {
        (await loginRepository.login(userLogin)).fold(
          _failStateNavigate,
          (success) => _syncLoggedVideos,
        );
      },
    );

    (await videosRepository.getAllVideos()).fold(
      _failStateNavigate,
      (success) => Modular.to.pushReplacementNamed(
        ModulesRouteNames.homeModule,
        arguments: const Right<Failure, HomeState>(HomeState.success),
      ),
    );
  }

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
