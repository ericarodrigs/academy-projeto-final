import 'package:flutter/material.dart';
import 'package:rarovideowall/src/shared/constants/app_colors.dart';
import 'package:rarovideowall/src/shared/constants/app_text_styles.dart';

class WDotText extends StatelessWidget {
  const WDotText({
    Key? key,
    required this.text,
    this.style = TextStyles.black14w400Urbanist,
    this.dotSize = 30,
  }) : super(key: key);

  final String text;
  final TextStyle style;
  final double dotSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '\u{2022} ',
          style: TextStyle(
            color: AppColors.black,
            fontSize: dotSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text,
          style: style,
        ),
      ],
    );
  }
}
