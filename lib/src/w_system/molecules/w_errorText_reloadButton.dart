import 'package:flutter/material.dart';

import '../../shared/constants/app_text_styles.dart';
class WErrorReload extends StatelessWidget {
  const WErrorReload({required this.errorText, required this.onPressed, Key? key}) : super(key: key);
  final String errorText;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(errorText, style: TextStyles.errorRed),
          ElevatedButton(
              onPressed: onPressed,
              child: const Text('Recarregar'))
        ],
      ),
    );
  }
}
