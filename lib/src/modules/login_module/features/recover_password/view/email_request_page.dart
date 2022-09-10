import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rarovideowall/src/modules/login_module/features/recover_password/controller/recover_password_controller.dart';
import 'package:rarovideowall/src/shared/constants/app_text_styles.dart';
import 'package:rarovideowall/src/shared/constants/validator.dart';
import 'package:rarovideowall/src/w_system/atoms/buttons/w_elevated_button.dart';
import 'package:rarovideowall/src/w_system/atoms/progress_indicators/w_circular_progress_indicator.dart';
import 'package:rarovideowall/src/w_system/atoms/texts/w_text_form_field.dart';

class EmailRequestPage extends StatefulWidget {
  const EmailRequestPage({Key? key}) : super(key: key);

  @override
  State<EmailRequestPage> createState() => _EmailRequestPageState();
}

class _EmailRequestPageState extends State<EmailRequestPage> {
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
            child: Column(children: [
              const Padding(
                padding: EdgeInsets.only(left: 18, top: 64, right: 18),
                child: Text('Digite seu email',
                    style: TextStyles.purple30w700Urbanist),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 176, 18, 20),
                child: WTextFormField(
                  isEnabled: recoverController.isFieldEnabled(),
                  controller: recoverController.emailController,
                  validator: Validator.validateEmail,
                  keyboardType: TextInputType.emailAddress,
                  text: 'Digite seu email',
                ),
              ),
              Visibility(
                  visible: !recoverController.isFieldEnabled(),
                  child: const WCircularProgressIndicator()),
              Visibility(
                  visible: recoverController.errorText != null ? true : false,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18, top: 8, right: 18),
                    child: Text(
                      recoverController.errorText ?? '',
                      style: TextStyles.errorRed,
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.fromLTRB(44, 50, 44, 16),
                child: WElevatedButton(
                  text: 'Enviar código',
                  function: () {
                    if (recoverController.isTryRecoverWithEmail) {
                      recoverController.verifyEmail();
                    }
                  },
                ),
              ),
            ]),
          ),
        );
      }),
    ));
  }
}
