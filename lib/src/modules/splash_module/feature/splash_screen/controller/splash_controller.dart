// ignore_for_file: library_private_types_in_public_api

import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:rarovideowall/src/modules/home/features/home/controller/home_controller.dart';

import 'package:rarovideowall/src/modules/splash_module/interfaces/splash_controller_interface.dart';
import 'package:rarovideowall/src/modules_route_names.dart';
import 'package:rarovideowall/src/shared/global_states/logged_state/logged_state.dart';
import 'package:rarovideowall/src/shared/interfaces/api_service.dart';
import 'package:rarovideowall/src/shared/interfaces/login_repository_interface.dart';
import 'package:rarovideowall/src/shared/interfaces/videos_repository_interface.dart';

import 'package:rarovideowall/src/shared/models/failure.dart';
import 'package:rarovideowall/src/shared/repositories/local_storage_user_repository.dart';

part 'splash_controller.g.dart';

class SplashController = _SplashController with _$SplashController;

abstract class _SplashController with Store implements ISplashController {
  final ILoginRepository loginRepository;
  final LocalStorageUserRepository localStorageUserRepository;
  final LoggedState loggedState;
  final ApiService service;
  final IVideosRepository videosRepository;

  _SplashController({
    required this.loginRepository,
    required this.localStorageUserRepository,
    required this.loggedState,
    required this.service,
    required this.videosRepository,
  });

  @observable
  PageState pageState = PageState.fine;

  @action
  Future<void> changePageState(PageState state) async {
    pageState = state;
  }

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
                      changePageState(PageState.fine),
                    }));
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

enum PageState { error, fine }
