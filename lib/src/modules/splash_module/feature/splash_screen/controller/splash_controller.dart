import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:rarovideowall/src/modules/splash_module/interfaces/splash_controller_interface.dart';
import 'package:rarovideowall/src/modules_route_names.dart';
import 'package:rarovideowall/src/shared/models/data_sources/login_user_model.dart';
import 'package:rarovideowall/src/shared/models/data_sources/video_model.dart';
import 'package:rarovideowall/src/shared/models/failure.dart';
import 'package:rarovideowall/src/shared/models/local_storage_service/local_storage_user_repository.dart';
import 'package:rarovideowall/src/shared/models/repositories/login_repository.dart';
import 'package:rarovideowall/src/shared/models/repositories/videos_repository.dart';

class SplashController implements ISplashController {
  final LocalStorageUserRepository localStorageUserRepository;
  final LoginRepository loginRepository;
  final VideosRepository videosRepository;

  SplashController({
    required this.localStorageUserRepository,
    required this.loginRepository,
    required this.videosRepository,
  });

  @override
  Future<void> tryLocalStorageLogin() async {
    Either<Failure, LoginUserModel> localStorage =
        await localStorageUserRepository.get();
    localStorage.fold(
      (Failure error) {},
      (LoginUserModel userLogin) {
        loginRepository.login(userLogin);
      },
    );
    Either<Failure, List<VideoModel>> videosResp =
        await videosRepository.getAll();
    Modular.to.pushReplacementNamed(ModulesRouteNames.homeModule,
        arguments: videosResp);
  }
}
