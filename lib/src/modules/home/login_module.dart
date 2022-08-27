import 'package:flutter_modular/flutter_modular.dart';
import 'package:rarovideowall/src/modules/home/features/home/view/home_page.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => HomePage())
  ];
}
