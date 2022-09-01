import 'package:flutter_modular/flutter_modular.dart';
import 'package:rarovideowall/src/modules/home/features/home/controller/home_controller.dart';
import 'package:rarovideowall/src/modules/home/features/home/view/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<HomeController>(
      (i) => HomeController(
        videosState: i(),
        loggedState: i(),
        videosRepository: i(),
        loginRepository: i(),
      ),
    )
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => HomePage(
        initialState: args.data,
      ),
    )
  ];
}
