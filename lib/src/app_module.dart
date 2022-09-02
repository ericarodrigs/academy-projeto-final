import 'package:flutter_modular/flutter_modular.dart';
import 'package:rarovideowall/src/modules/home/home_module.dart';
import 'package:rarovideowall/src/modules/login_module/login_module.dart';
import 'package:rarovideowall/src/modules/splash_module/splash_module.dart';
import 'package:rarovideowall/src/modules_route_names.dart';
import 'package:rarovideowall/src/shared/global_states/logged_state/logged_state.dart';
import 'package:rarovideowall/src/shared/global_states/videos_state/videos_state.dart';
import 'package:rarovideowall/src/shared/interfaces/api_service.dart';
import 'package:rarovideowall/src/shared/interfaces/local_storage_service.dart';

import 'package:rarovideowall/src/shared/repositories/local_storage_user_repository.dart';
import 'package:rarovideowall/src/shared/repositories/login_repository.dart';
import 'package:rarovideowall/src/shared/repositories/videos_repository.dart';
import 'package:rarovideowall/src/shared/services/dio_service.dart';
import 'package:rarovideowall/src/shared/services/shared_preferences_service.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<ApiService>((i) => DioService.instance),
    Bind<LocalStorageService>((i) => SharedPreferencesService.instance),
    Bind<LoggedState>((i) => LoggedState.instance),
    Bind<VideosState>((i) => VideosState.instance),
    Bind<LoginRepository>((i) => LoginRepository(
          loggedState: i(),
          service: i(),
        )),
    Bind<VideosRepository>(
        (i) => VideosRepository(service: i(), videosState: i())),
    Bind<LocalStorageUserRepository>(
        (i) => LocalStorageUserRepository(service: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: SplashModule()),
    ModuleRoute(ModulesRouteNames.homeModule, module: HomeModule()),
    ModuleRoute(ModulesRouteNames.loginModule, module: LoginModule()),
  ];
}
