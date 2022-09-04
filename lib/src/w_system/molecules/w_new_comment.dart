import 'package:flutter/material.dart';
import 'package:rarovideowall/src/w_system/atoms/buttons/w_elevated_button.dart';
import 'package:rarovideowall/src/w_system/atoms/texts/w_text.dart';
import 'package:rarovideowall/src/w_system/atoms/texts/w_text_form_field.dart';

class WNewComment extends StatelessWidget {
  const WNewComment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: WText(text: 'Comentários',),
        ),
        WTextFormField(text: 'Deixe seu comentário'),
        WElevatedButton(text: 'Comentar'),
      ],
    );
  }
}
