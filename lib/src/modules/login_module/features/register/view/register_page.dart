import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rarovideowall/src/modules/login_module/features/register/controller/register_controller.dart';
import 'package:rarovideowall/src/shared/constants/app_text_styles.dart';
import 'package:rarovideowall/src/w_system/atoms/custom_buttons.dart';
import 'package:rarovideowall/src/w_system/atoms/custom_texts.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final registerController = Modular.get<RegisterController>();

  @override
  void initState() {
    registerController.registerInitState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Observer(
          builder: (_) {
            return SingleChildScrollView(
              child: Form(
                key: registerController.formKey,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(64.0),
                      child: Text('Registrar',
                          style: TextStyles.purple30w700Urbanist),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18, 12, 18, 8),
                      child: WTextFormField(
                          isEnabled: registerController.isFieldEnabled(),
                          controller: registerController.nameController,
                          validator: registerController.registerValidator.validateName,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.name,
                          text: 'Digite seu nome'),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18,12, 18, 8),
                      child: WTextFormField(
                          isEnabled: registerController.isFieldEnabled(),
                          controller: registerController.emailController,
                          validator: registerController.registerValidator.validateEmail,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          text: 'Digite seu email'),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18, 12, 18, 8),
                      child: WTextFormField(
                          isEnabled: registerController.isFieldEnabled(),
                          controller: registerController.passwordController,
                          validator: registerController.registerValidator.validatePassword,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          text: 'Digite sua senha'),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18, 12, 18, 64),
                      child: WTextFormField(
                          isEnabled: registerController.isFieldEnabled(),
                          controller: registerController.codeClassController,
                          validator: registerController.registerValidator.validateCodeClass,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.text,
                          text: 'Digite o código da sua turma'),
                    ),
                    Visibility(
                        visible: !registerController.isFieldEnabled(),
                        child: const CircularProgressIndicator()),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(44, 12, 44, 8),
                      child: WElevatedButton(text: 'Registrar',
                        isEnabled: registerController.isFieldEnabled(),
                        function: () {
                          if (registerController.isTryRegister) {
                          }
                        },),
                    ),
                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}
