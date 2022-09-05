import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rarovideowall/src/modules/login_module/features/recover_password/controller/recover_password_controller.dart';
import 'package:rarovideowall/src/shared/constants/app_text_styles.dart';
import 'package:rarovideowall/src/w_system/atoms/buttons/w_elevated_button.dart';
import 'package:rarovideowall/src/w_system/atoms/texts/w_text_form_field.dart';

class EmailRequest extends StatefulWidget {
  const EmailRequest({Key? key}) : super(key: key);

  @override
  State<EmailRequest> createState() => _EmailRequestState();
}

class _EmailRequestState extends State<EmailRequest> {
  final recoverController = Modular.get<RecoverPasswordController>();

  @override
  void initState() {
    recoverController.recoverInitState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: Observer(builder: (_) {
        return SingleChildScrollView(
          child: Form(
            key: recoverController.formKeyEmail,
            child: Container(
              color: const Color.fromRGBO(240, 240, 240, 1),
              child: Column(children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(75, 80, 51, 0),
                  child: Text('Digite seu email',
                      style: TextStyles.purple30w700Urbanist),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 200, 20, 20),
                  child: WTextFormField(
                    text: 'Digite seu email',
                    isEnabled: recoverController.isFieldEnabled(),
                    controller: recoverController.emailController,
                    validator: recoverController
                        .recoverPasswordValidator.validateEmail,
                    keyboardType: TextInputType.emailAddress,
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
                    text: 'Enviar codigo',
                    function: () {
                      if (recoverController.isTryRecoverWithEmail) {
                        recoverController.verifyEmail();
                      }
                    },
                  ),
                ),
              ]),
            ),
          ),
        );
      }),
    ));
  }
}
