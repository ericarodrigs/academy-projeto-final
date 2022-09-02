import 'package:flutter_modular/flutter_modular.dart';
import 'package:rarovideowall/src/modules/login_module/login_module.dart';
import 'package:rarovideowall/src/modules/splash_module/feature/splash_screen/controller/splash_controller.dart';
import 'package:rarovideowall/src/modules/splash_module/feature/splash_screen/view/splash_page.dart';
import 'package:rarovideowall/src/modules/splash_module/interfaces/splash_controller_interface.dart';

class SplashModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<ISplashController>((i) => SplashController(
          localStorageUserRepository: i(),
          loginRepository: i(),
          videosRepository: i(),
        ))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => const SplashPage()),
    ModuleRoute('/login', module: LoginModule())
  ];
}