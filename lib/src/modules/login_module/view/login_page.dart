import 'package:flutter/material.dart';
import 'package:rarovideowall/src/w_system/atoms/custom_buttons.dart';
import 'package:rarovideowall/src/w_system/atoms/custom_texts.dart';
import '../../../shared/constants/app_text_styles.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                Image.asset(
                  "assets/images/capelo.png",
                  height: 120,
                  width: 120,
                ),
                const Text("Raro Tube", style: TextStyles.purple30w700Urbanist),
                const Padding(
                  padding: EdgeInsets.fromLTRB(18, 59, 18, 33),
                  child: WTextFormFIeld(
                    text: 'E-mail',
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  child: WTextFormFIeld(text: 'Senha'),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 18, 0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: WTextButton(
                        onTap: () {},
                        text: 'Esqueci minha senha...',
                        style: TextStyles.boldTextButton),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(44, 60, 44, 20),
                  child: WElevatedButton(
                    text: 'Entrar',
                    function: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 44.0),
                  child: WElevatedButton(
                    text: 'Registrar',
                    function: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
