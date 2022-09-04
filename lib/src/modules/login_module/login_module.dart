import 'package:flutter_modular/flutter_modular.dart';
import 'package:rarovideowall/src/modules/login_module/features/recover_password/controller/recover_password_controller.dart';
import 'package:rarovideowall/src/modules/login_module/features/recover_password/controller/recover_password_validator.dart';
import 'package:rarovideowall/src/modules/login_module/features/recover_password/view/code_request_page.dart';
import 'package:rarovideowall/src/modules/login_module/features/recover_password/view/email_request_page.dart';
import 'package:rarovideowall/src/modules/login_module/features/recover_password/view/change_password_page.dart';
import 'package:rarovideowall/src/modules/login_module/features/register/view/confirm_register_page.dart';
import 'package:rarovideowall/src/modules/login_module/features/login/controller/login_controller.dart';
import 'package:rarovideowall/src/modules/login_module/features/login/controller/login_validator.dart';
import 'package:rarovideowall/src/modules/login_module/features/login/view/login_page.dart';
import 'package:rarovideowall/src/modules/login_module/features/register/controller/register_controller.dart';
import 'package:rarovideowall/src/modules/login_module/features/register/controller/register_validator.dart';
import 'package:rarovideowall/src/modules/login_module/features/register/view/register_page.dart';
import 'package:rarovideowall/src/modules_route_names.dart';
import 'package:rarovideowall/src/shared/repositories/recover_password_repository.dart';

class LoginModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        // Bind((i) => DioService()),
        Bind.singleton((i) => LoginValidator()),
        Bind.singleton((i) => LoginController()),
        Bind.singleton((i) => RegisterController()),
        Bind.singleton((i) => RegisterValidator()),
        Bind.singleton((i) => RecoverPasswordValidator()),
        Bind.singleton((i) => RecoverPasswordController()),
        Bind.singleton((i) => RecoverPasswordRepository(service: i.get()))
        //  Bind.singleton((i) => LoginRepository(i.get())),
        //Bind.singleton((i) => LoginModel()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, __) => const LoginPage()),
        ChildRoute(ModulesRouteNames.registerRoute,
            child: (_, __) => const RegisterPage()),
        ChildRoute(ModulesRouteNames.confirmRegisterRoute,
            child: (_, __) => const ConfirmRegisterPage()),
        ChildRoute(ModulesRouteNames.requestEmailRoute, child: (_, __) => const EmailRequest()),
        ChildRoute(ModulesRouteNames.requestCodeRoute, child: (_, __) => const CodeRequest()),
        ChildRoute(ModulesRouteNames.changePasswordRoute, child: (_, __) => const ChangePassword()),
      ];
}
