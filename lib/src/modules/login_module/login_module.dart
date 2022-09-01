import 'package:flutter_modular/flutter_modular.dart';
import 'package:rarovideowall/src/modules/login_module/features/login/controller/login_controller.dart';
import 'package:rarovideowall/src/modules/login_module/features/login/controller/login_validator.dart';
import 'package:rarovideowall/src/modules/login_module/features/login/view/login_page.dart';
import 'package:rarovideowall/src/modules/login_module/features/register/controller/register_controller.dart';
import 'package:rarovideowall/src/modules/login_module/features/register/controller/register_validator.dart';
import 'package:rarovideowall/src/modules/login_module/features/register/view/register_page.dart';

class LoginModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        // Bind((i) => DioService()),
        Bind.singleton((i) => LoginValidator()),
        Bind.singleton((i) => LoginController()),
        Bind.singleton((i) => RegisterController()),
        Bind.singleton((i) => RegisterValidator()),
        //  Bind.singleton((i) => LoginRepository(i.get())),
        //Bind.singleton((i) => LoginModel()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (context, args) => const LoginPage()),
    ChildRoute('/register/', child: (context, args) => const RegisterPage())
      ];
}
