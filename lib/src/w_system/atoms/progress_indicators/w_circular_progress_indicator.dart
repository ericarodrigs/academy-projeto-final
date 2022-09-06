import 'package:flutter/material.dart';
import 'package:rarovideowall/src/shared/constants/app_colors.dart';

class WCircularProgressIndicator extends StatelessWidget {
  const WCircularProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      backgroundColor: AppColors.lightPurple,
      color: AppColors.deepPurple,
    );
  }
}
