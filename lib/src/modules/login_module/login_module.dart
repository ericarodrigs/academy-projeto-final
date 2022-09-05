import 'package:flutter_modular/flutter_modular.dart';
import 'package:rarovideowall/src/modules/login_module/features/register/view/confirm_register_page.dart';
import 'package:rarovideowall/src/modules/login_module/features/login/controller/login_controller.dart';
import 'package:rarovideowall/src/modules/login_module/features/login/view/login_page.dart';
import 'package:rarovideowall/src/modules/login_module/features/register/controller/register_controller.dart';
import 'package:rarovideowall/src/modules/login_module/features/register/view/register_page.dart';
import 'package:rarovideowall/src/modules_route_names.dart';
import 'package:rarovideowall/src/shared/constants/validator.dart';

class LoginModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        // Bind((i) => DioService()),
        Bind.singleton(
          (i) => LoginController(
            loginRepository: i(),
          ),
        ),
        Bind.singleton(
          (i) => RegisterController(
            loginRepository: i(),
          ),
        ),
        //  Bind.singleton((i) => LoginRepository(i.get())),
        //Bind.singleton((i) => LoginModel()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, __) => const LoginPage()),
        ChildRoute('/register', child: (_, __) => const RegisterPage()),
        ChildRoute('/register/confirm',
            child: (_, __) => const ConfirmRegisterPage())
      ];
}
