import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rarovideowall/src/modules/login_module/features/recover_password/controller/recover_password_controller.dart';
import 'package:rarovideowall/src/shared/constants/app_text_styles.dart';
import 'package:rarovideowall/src/w_system/atoms/buttons/w_elevated_button.dart';
import 'package:rarovideowall/src/w_system/atoms/texts/w_text_form_field.dart';

class CodeRequest extends StatefulWidget {
  const CodeRequest({Key? key}) : super(key: key);

  @override
  State<CodeRequest> createState() => _CodeRequestState();
}

class _CodeRequestState extends State<CodeRequest> {
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
              key: recoverController.formKeyCode,
              child: Container(
                color: const Color.fromRGBO(240, 240, 240, 1),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(65, 80, 51, 0),
                      child: Text(
                        'Digite seu codigo de confirmação enviado para seu email',
                        style: TextStyles.purple30w700Urbanist,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 100, 20, 20),
                      child: WTextFormField(
                        text: 'Digite o codigo',
                        isEnabled: recoverController.isFieldEnabled(),
                        controller:
                            recoverController.recuperationCodeController,
                        validator: recoverController
                            .recoverPasswordValidator.validateCode,
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    Visibility(
                        visible: !recoverController.isFieldEnabled(),
                        child: const CircularProgressIndicator()),
                    Visibility(
                        visible: true,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                          child: Text(
                            recoverController.errorText ?? '',
                            style: TextStyles.errorRed,
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 76, 40, 0),
                      child: WElevatedButton(
                        text: 'Confirmar',
                        function: () {
                          if (recoverController.isTryRecoverWithCode) {
                            Modular.to.pushNamed('change_password').then(
                                (value) =>
                                    recoverController.recoverInitState());
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
