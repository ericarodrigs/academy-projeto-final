import 'package:flutter_modular/flutter_modular.dart';
import 'package:rarovideowall/src/modules/login_module/view/login_page.dart';
import 'package:rarovideowall/src/shared/validators/login_validator.dart';

import 'controller/login_controller.dart';

class LoginModule extends Module {
  @override
  List<Bind<Object>> get binds => [
   // Bind((i) => DioService()),
   Bind.singleton((i) => LoginValidator()),
    Bind.singleton((i) => LoginController()),
  //  Bind.singleton((i) => LoginRepository(i.get())),
    //Bind.singleton((i) => LoginModel()),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(Modular.initialRoute, child: (context, args) => const LoginPage()),
  ];
}
