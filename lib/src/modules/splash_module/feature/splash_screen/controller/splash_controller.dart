import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:rarovideowall/src/modules/splash_module/interfaces/splash_controller_interface.dart';
import 'package:rarovideowall/src/modules_route_names.dart';

import 'package:rarovideowall/src/shared/models/failure.dart';
import 'package:rarovideowall/src/shared/models/login_user_model.dart';
import 'package:rarovideowall/src/shared/models/video_model.dart';
import 'package:rarovideowall/src/shared/repositories/local_storage_user_repository.dart';
import 'package:rarovideowall/src/shared/repositories/login_repository.dart';
import 'package:rarovideowall/src/shared/repositories/videos_repository.dart';

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
    await localStorage.fold(
      (Failure error) {},
      (LoginUserModel userLogin) async {
        await loginRepository.login(userLogin);
      },
    );
    await loginRepository
        .login(LoginUserModel(email: 'markimwrs@hotmail.com', senha: '12345'));
    Either<Failure, List<VideoModel>> videosResp =
        await videosRepository.getAll();
    Modular.to.pushReplacementNamed(
      ModulesRouteNames.homeModule,
      arguments: videosResp,
    );
  }
}
