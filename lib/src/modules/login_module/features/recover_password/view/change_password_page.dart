import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rarovideowall/src/modules/login_module/features/recover_password/controller/recover_password_controller.dart';
import 'package:rarovideowall/src/shared/constants/app_text_styles.dart';
import 'package:rarovideowall/src/shared/constants/validator.dart';
import 'package:rarovideowall/src/w_system/atoms/buttons/w_elevated_button.dart';
import 'package:rarovideowall/src/w_system/atoms/texts/w_text_form_field.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final recoverController = Modular.get<RecoverPasswordController>();
  String _password = '';

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
              child: Container(
                color: const Color.fromRGBO(240, 240, 240, 1),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 80, 0, 110),
                      child: Text(
                        'Digite sua nova senha',
                        style: TextStyles.purple30w700Urbanist,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: WTextFormField(
                        text: 'Digite sua nova senha',
                        isEnabled: recoverController.isFieldEnabled(),
                        controller: recoverController.passwordController,
                        validator: Validator.validatePassword,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.visiblePassword,
                        onChanged: (value) => _password = value,
                        obscureText: recoverController.isHiddenPassword,
                        togglePasswordView: (){
                          recoverController.changePasswordVisibility();
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 21, 20, 66),
                      child: WTextFormField(
                        text: 'Digite sua nova senha novamente',
                        isEnabled: recoverController.isFieldEnabled(),
                        validator: (value) {
                          if (value != _password) {
                            return 'As senhas não coincidem';
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: recoverController.isHiddenConfirmPassword,
                        togglePasswordView: (){
                          recoverController.changeConfirmPasswordVisibility();
                        },
                      ),
                    ),
                    Visibility(
                        visible: !recoverController.isFieldEnabled(),
                        child: const CircularProgressIndicator()),
                    Visibility(
                        visible: true,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(30, 16, 20, 0),
                          child: Text(
                            recoverController.errorText ?? '',
                            style: TextStyles.errorRed,
                            textAlign: TextAlign.center,
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 77, 40, 0),
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
            ),
          );
        }),
      ),
    );
  }
}
