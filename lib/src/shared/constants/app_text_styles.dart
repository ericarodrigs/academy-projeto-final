import 'package:flutter/material.dart';
import 'package:rarovideowall/src/shared/constants/app_colors.dart';

class TextStyles {
  static const TextStyle purple30w700Urbanist = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w700,
    color: AppColors.purpleTitle,
    fontFamily: "Urbanist",
    letterSpacing: -0.05,
  );
  static const TextStyle black14BoldUrbanist = TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: 'Urbanist',
    fontSize: 14,
    letterSpacing: 0.02,
    color: AppColors.black,
  );

  static const TextStyle errorRed = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: AppColors.errorColor,
  );

  static const TextStyle deepPurple16w700Urbanist = TextStyle(
    fontFamily: 'Urbanist',
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: AppColors.deepPurple,
    letterSpacing: 0.02,
  );

  static const TextStyle black16w700Urbanist = TextStyle(
    fontFamily: 'Urbanist',
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: AppColors.black,
    letterSpacing: 0.02,
  );

  static const TextStyle black14w400Urbanist = TextStyle(
    fontFamily: 'Urbanist',
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: AppColors.black,
    letterSpacing: 0.02,
  );

  static const TextStyle black26w700Urbanist = TextStyle(
    fontFamily: 'Urbanist',
    fontWeight: FontWeight.w700,
    fontSize: 26,
    color: AppColors.black,
    letterSpacing: 0.02,
  );
}
