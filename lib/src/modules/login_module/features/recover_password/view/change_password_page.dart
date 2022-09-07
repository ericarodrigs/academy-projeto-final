import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rarovideowall/src/modules/login_module/features/recover_password/controller/recover_password_controller.dart';
import 'package:rarovideowall/src/shared/constants/app_text_styles.dart';
import 'package:rarovideowall/src/shared/constants/validator.dart';
import 'package:rarovideowall/src/w_system/atoms/buttons/w_elevated_button.dart';
import 'package:rarovideowall/src/w_system/atoms/texts/w_text_form_field.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final recoverController = Modular.get<RecoverPasswordController>();

  @override
  void initState() {
    recoverController.recoverInitState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Observer(builder: (_) {
          return SingleChildScrollView(
            child: Form(
              key: recoverController.formKeyNewPassword,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(64.0),
                    child: Text(
                      'Digite sua nova senha',
                      style: TextStyles.purple30w700Urbanist,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(18, 12, 18, 12),
                    child: WTextFormField(
                      isEnabled: recoverController.isFieldEnabled(),
                      controller: recoverController.passwordController,
                      validator: Validator.validatePassword,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: recoverController.isHiddenPassword,
                      togglePasswordView: () {
                        recoverController.changePasswordVisibility();
                      },
                      text: 'Digite sua nova senha',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(18, 12, 18, 12),
                    child: WTextFormField(
                      isEnabled: recoverController.isFieldEnabled(),
                      controller:
                          recoverController.passwordConfirmationController,
                      validator: (valuePasswordConfirmation) {
                        return Validator.validatePasswordConfirmation(
                            valuePasswordConfirmation,
                            recoverController.passwordController.text);
                      },
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: recoverController.isHiddenConfirmPassword,
                      togglePasswordView: () {
                        recoverController.changeConfirmPasswordVisibility();
                      },
                      text: 'Digite sua nova senha novamente',
                    ),
                  ),
                  Visibility(
                      visible: !recoverController.isFieldEnabled(),
                      child: const CircularProgressIndicator()),
                  Visibility(
                      visible: false,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 18, top: 8, right: 18),
                        child: Text(
                          recoverController.errorText ?? '',
                          style: TextStyles.errorRed,
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(44, 72, 44, 16),
                    child: WElevatedButton(
                      text: 'Alterar senha',
                      function: () {
                        if (recoverController.isTryRecoverNewPassword) {
                          recoverController.updatePassword(context);
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
