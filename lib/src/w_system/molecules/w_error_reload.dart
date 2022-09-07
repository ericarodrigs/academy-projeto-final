import 'package:flutter/material.dart';
import 'package:rarovideowall/src/shared/constants/app_text_styles.dart';
import 'package:rarovideowall/src/w_system/atoms/buttons/w_elevated_button.dart';

class WErrorReload extends StatelessWidget {
  const WErrorReload(
      {required this.errorText, required this.onPressed, Key? key})
      : super(key: key);
  final String errorText;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(errorText, style: TextStyles.errorRed),
          const SizedBox(
            height: 5,
          ),
          WElevatedButton(
            function: onPressed,
            text: 'Recarregar',
          ),
        ],
      ),
    );
  }
}
