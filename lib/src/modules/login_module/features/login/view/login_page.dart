import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rarovideowall/src/modules/login_module/features/login/controller/login_controller.dart';
import 'package:rarovideowall/src/shared/constants/app_text_styles.dart';
import 'package:rarovideowall/src/w_system/atoms/buttons/w_elevated_button.dart';
import 'package:rarovideowall/src/w_system/atoms/texts/w_text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginController = Modular.get<LoginController>();

  @override
  void initState() {
    loginController.loginInitState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Observer(
          builder: (_) => SingleChildScrollView(
            child: Form(
              key: loginController.formKey,
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/capelo.png",
                    height: 120,
                    width: 120,
                  ),
                  const Text("Raro Tube",
                      style: TextStyles.purple30w700Urbanist),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(18, 59, 18, 33),
                    child: WTextFormField(
                        isEnabled: loginController.isFieldEnabled(),
                        controller: loginController.emailController,
                        validator: loginController.loginValidator.validateEmail,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        text: 'E-mail'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: WTextFormField(
                        isEnabled: loginController.isFieldEnabled(),
                        controller: loginController.pwController,
                        validator: loginController.loginValidator.validatePW,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: loginController.isHiddenPassword,
                        togglePasswordView: () {
                          loginController.changePasswordVisibility();
                        },
                        text: 'Senha'),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 18, 0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: WTextButton(
                          isEnabled: loginController.isFieldEnabled(),
                          onTap: () {
                            // Modular.to.pushNamed('recover').then((value) => loginController.loginInitState(););
                          },
                          text: 'Esqueci minha senha...',
                          style: TextStyles.black14BoldUrbanist),
                    ),
                  ),
                  Visibility(
                      visible: !loginController.isFieldEnabled(),
                      child: const CircularProgressIndicator()),
                  Visibility(
                      visible: true,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                        child: Text(
                          loginController.errorText ?? '',
                          style: TextStyles.errorRed,
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(44, 60, 44, 20),
                    child: WElevatedButton(
                      text: 'Entrar',
                      isEnabled: loginController.isFieldEnabled(),
                      function: () {
                        if (loginController.isTryLogin) {
                          loginController.logIn();
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 44.0),
                    child: WElevatedButton(
                      text: 'Registrar',
                      isEnabled: loginController.isFieldEnabled(),
                      function: () {
                        Modular.to
                            .pushNamed('/login/register/')
                            .then((value) => loginController.loginInitState());
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
