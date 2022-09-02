import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rarovideowall/src/shared/constants/app_text_styles.dart';
import 'package:rarovideowall/src/w_system/atoms/buttons/w_elevated_button.dart';
import 'package:rarovideowall/src/w_system/atoms/texts/w_text_form_field.dart';

class ConfirmRegisterPage extends StatefulWidget {
  const ConfirmRegisterPage({Key? key}) : super(key: key);

  @override
  State<ConfirmRegisterPage> createState() => _ConfirmRegisterPageState();
}

class _ConfirmRegisterPageState extends State<ConfirmRegisterPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Observer(builder: (_) {
          return SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(64.0),
                    child: Text(
                        'Digite seu código de confirmação enviado para seu email.',
                        style: TextStyles.purple30w700Urbanist),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(18, 12, 18, 8),
                    child: WTextFormField(
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.text,
                        text: 'Digite o código aqui'),
                  ),
                  const Visibility(
                      visible: false, child: CircularProgressIndicator()),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(44, 73, 44, 8),
                    child: WElevatedButton(
                      text: 'Confirmar',
                      function: () {},
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
