import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rarovideowall/src/modules/login_module/features/recover_password/controller/recover_password_controller.dart';
import 'package:rarovideowall/src/shared/constants/app_text_styles.dart';
import 'package:rarovideowall/src/shared/constants/validator.dart';
import 'package:rarovideowall/src/w_system/atoms/buttons/w_elevated_button.dart';
import 'package:rarovideowall/src/w_system/atoms/progress_indicators/w_circular_progress_indicator.dart';
import 'package:rarovideowall/src/w_system/atoms/texts/w_text_form_field.dart';
import 'package:rarovideowall/src/w_system/molecules/w_app_bar.dart';

class CodeRequestPage extends StatefulWidget {
  const CodeRequestPage({Key? key}) : super(key: key);

  @override
  State<CodeRequestPage> createState() => _CodeRequestPageState();
}

class _CodeRequestPageState extends State<CodeRequestPage> {
  final recoverController = Modular.get<RecoverPasswordController>();

  @override
  void initState() {
    recoverController.recoverInitState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WAppBar(),
      body: SafeArea(
        child: Observer(builder: (_) {
          return SingleChildScrollView(
            child: Form(
              key: recoverController.formKeyCode,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 18, top: 64, right: 18),
                    child: Text(
                      'Digite seu código de confirmação enviado para seu email',
                      style: TextStyles.purple30w700Urbanist,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(18, 100, 18, 20),
                    child: WTextFormField(
                      isEnabled: recoverController.isFieldEnabled(),
                      controller: recoverController.recuperationCodeController,
                      validator: Validator.validateCodeVerification,
                      keyboardType: TextInputType.text,
                      text: 'Digite o código',
                    ),
                  ),
                  Visibility(
                      visible: !recoverController.isFieldEnabled(),
                      child: const WCircularProgressIndicator()),
                  Visibility(
                      visible:
                          recoverController.errorText != null ? true : false,
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
                      text: 'Confirmar',
                      function: () {
                        if (recoverController.isTryRecoverWithCode) {
                          recoverController.goToChangePasswordPage();
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
