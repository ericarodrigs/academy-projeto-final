import 'package:flutter_modular/flutter_modular.dart';
import 'package:rarovideowall/src/modules/splash_module/feature/splash_screen/controller/splash_controller.dart';
import 'package:rarovideowall/src/modules/splash_module/feature/splash_screen/view/splash_page.dart';

class SplashModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<SplashController>((i) => SplashController(
          loginRepository: i(),
          localStorageUserRepository: i(),
          loggedState: i(),
          service: i(),
          videosRepository: i(),
        ))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => const SplashPage()),
  ];
}
