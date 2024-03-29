import 'package:flutter_modular/flutter_modular.dart';
import 'package:rarovideowall/src/modules/login_module/features/recover_password/controller/recover_password_controller.dart';
import 'package:rarovideowall/src/modules/login_module/features/recover_password/view/code_request_page.dart';
import 'package:rarovideowall/src/modules/login_module/features/recover_password/view/email_request_page.dart';
import 'package:rarovideowall/src/modules/login_module/features/recover_password/view/change_password_page.dart';
import 'package:rarovideowall/src/modules/login_module/features/login/controller/login_controller.dart';
import 'package:rarovideowall/src/modules/login_module/features/login/view/login_page.dart';
import 'package:rarovideowall/src/modules/login_module/features/register/controller/register_controller.dart';
import 'package:rarovideowall/src/modules/login_module/features/register/view/register_page.dart';
import 'package:rarovideowall/src/modules/login_module/login_route_names.dart';

class LoginModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => LoginController(
              loginRepository: i(),
              localStorageUserRepository: i(),
              localStorageService: i(),
            )),
        Bind.singleton((i) => RegisterController(loginRepository: i())),
        Bind.singleton((i) => RecoverPasswordController(loginRepository: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, __) => const LoginPage()),
        ChildRoute('/${LoginRouteNames.register}',
            child: (_, __) => const RegisterPage()),
        ChildRoute('/${LoginRouteNames.requestEmailRoute}',
            child: (_, __) => const EmailRequestPage()),
        ChildRoute('/${LoginRouteNames.requestCodeRoute}',
            child: (_, __) => const CodeRequestPage()),
        ChildRoute('/${LoginRouteNames.changePasswordRoute}',
            child: (_, __) => const ChangePasswordPage()),
      ];
}
