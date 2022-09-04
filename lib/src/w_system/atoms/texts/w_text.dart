import 'package:flutter/material.dart';
import 'package:rarovideowall/src/shared/constants/app_text_styles.dart';

class WText extends StatelessWidget {
  final String text;

  const WText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyles.black24w700Urbanist,
    );
  }
}
