import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rarovideowall/src/modules/login_module/features/login/controller/login_controller.dart';
import 'package:rarovideowall/src/shared/constants/app_colors.dart';
import 'package:rarovideowall/src/shared/constants/app_text_styles.dart';
import 'package:rarovideowall/src/shared/constants/validator.dart';
import 'package:rarovideowall/src/w_system/atoms/buttons/w_checkbox_button.dart';
import 'package:rarovideowall/src/w_system/atoms/buttons/w_elevated_button.dart';
import 'package:rarovideowall/src/w_system/atoms/buttons/w_text_button.dart';
import 'package:rarovideowall/src/w_system/atoms/progress_indicators/w_circular_progress_indicator.dart';
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
                  const Text("Raro Video Wall",
                      style: TextStyles.purple30w700Urbanist),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(18, 59, 18, 33),
                    child: WTextFormField(
                        isEnabled: loginController.isFieldEnabled(),
                        controller: loginController.emailController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        validator: Validator.validateEmailFilled,
                        text: 'E-mail'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: WTextFormField(
                      isEnabled: loginController.isFieldEnabled(),
                      controller: loginController.passwordController,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.visiblePassword,
                      validator: Validator.validatePasswordFilled,
                      obscureText: loginController.isHiddenPassword,
                      suffixIcon: IconButton(
                        icon: Icon(
                          loginController.isHiddenPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: loginController.isHiddenPassword
                              ? AppColors.lightPurple
                              : AppColors.deepPurple,
                        ),
                        onPressed: loginController.changePasswordVisibility,
                      ),
                      text: 'Senha',
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 18, 0),
                        child: Row(
                          children: [
                            WCheckBoxButton(
                              value: loginController.isChecked,
                              onChanged: (_) => loginController.toggleChecked(),
                            ),
                            const Text('Lembar de mim.',
                                style: TextStyles.black14BoldUrbanist),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 18, 0),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: WTextButton(
                              isEnabled: loginController.isFieldEnabled(),
                              onTap: () {
                                loginController.goToRequestEmailPage();
                              },
                              text: 'Esqueci minha senha...',
                              style: TextStyles.black14BoldUrbanist),
                        ),
                      ),
                    ],
                  ),
                  Visibility(
                      visible: !loginController.isFieldEnabled(),
                      child: const WCircularProgressIndicator()),
                  Visibility(
                      visible: loginController.errorText != null ? true : false,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(44, 20, 44, 10),
                        child: Text(
                          loginController.errorText ?? '',
                          style: TextStyles.errorRed,
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(44, 50, 44, 10),
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
                    padding: const EdgeInsets.fromLTRB(44, 10, 44, 16),
                    child: WElevatedButton(
                      text: 'Registrar',
                      isEnabled: loginController.isFieldEnabled(),
                      function: () {
                        loginController.goToRegisterPage();
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
