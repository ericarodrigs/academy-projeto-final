import 'package:flutter_modular/flutter_modular.dart';
import 'package:rarovideowall/src/modules/home/home_module.dart';
import 'package:rarovideowall/src/modules/login_module/login_module.dart';
import 'package:rarovideowall/src/modules/splash_module/splash_module.dart';
import 'package:rarovideowall/src/modules_route_names.dart';
import 'package:rarovideowall/src/shared/global_states/logged_state/logged_state.dart';
import 'package:rarovideowall/src/shared/global_states/videos_state/videos_state.dart';
import 'package:rarovideowall/src/shared/interfaces/api_service.dart';
import 'package:rarovideowall/src/shared/interfaces/local_storage_service.dart';
import 'package:rarovideowall/src/shared/interfaces/videos_repository_interface.dart';

import 'package:rarovideowall/src/shared/repositories/login_repository.dart';
import 'package:rarovideowall/src/shared/repositories/videos_repository.dart';

import 'shared/interfaces/login_repository_interface.dart';
import 'shared/repositories/local_storage_user_repository.dart';
import 'shared/services/dio/dio_service.dart';
import 'shared/services/storage_service.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<ApiService>((i) => DioService.instance),
    Bind<LocalStorageService>((i) => StorageService.instance),
    Bind<LoggedState>((i) => LoggedState.instance),
    Bind<VideosState>((i) => VideosState.instance),
    Bind<ILoginRepository>(
      (i) => LoginRepository(
        loggedState: i(),
        service: i(),
        localStorageUserRepository: i(),
      ),
    ),
    Bind<IVideosRepository>(
      (i) => VideosRepository(
        service: i(),
        videosState: i(),
        loggedState: i(),
      ),
    ),
    Bind<LocalStorageUserRepository>(
      (i) => LocalStorageUserRepository(service: i()),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: SplashModule()),
    ModuleRoute(ModulesRouteNames.homeModule, module: HomeModule()),
    ModuleRoute(ModulesRouteNames.loginModule, module: LoginModule()),
  ];
}
