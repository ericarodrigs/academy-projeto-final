import 'package:flutter_modular/flutter_modular.dart';
import 'package:rarovideowall/src/modules/home/home_module.dart';
import 'package:rarovideowall/src/modules/splash_module/splash_module.dart';
import 'package:rarovideowall/src/modules_route_names.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: SplashModule()),
    ModuleRoute(ModulesRouteNames.homeModule, module: HomeModule()),
  ];
}
