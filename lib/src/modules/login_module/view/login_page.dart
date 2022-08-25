import 'package:flutter/material.dart';

import '../../../../w_system/atoms/custom_buttons.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Column(
          children: [
            Text("Raro Tube"),
            TextFormField(),
            TextFormField(),
            Align(alignment: Alignment.bottomRight,child:  Text('Esqueci a senha...')),
            Spacer(),
            WElevatedButton(
              text: 'Entrar',
              function: () {},
            ),
            const SizedBox(height: 20),
            WElevatedButton(
              text: 'Registrar',
              function: () {},
            )
          ],
        ),
      ),
    );
  }
}
