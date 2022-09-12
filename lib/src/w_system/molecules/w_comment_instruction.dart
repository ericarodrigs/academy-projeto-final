import 'package:flutter/material.dart';
import 'package:rarovideowall/src/w_system/atoms/texts/w_dot_text.dart';

class WCommentInstruction extends StatelessWidget {
  const WCommentInstruction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,
      children: const [
        WDotText(
          text:
              'Para deletar seu comentário pressione e segure o seu nome no comentário.',
        ),
        SizedBox(height: 10),
        WDotText(
          text:
              'Para editar seu comentário pressione e segure o texto do seu comentário.',
        ),
      ],
    );
  }
}
