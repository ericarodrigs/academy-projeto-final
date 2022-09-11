import 'package:flutter/material.dart';
import 'package:rarovideowall/src/shared/constants/app_colors.dart';

class WLinearProgressIndicator extends StatelessWidget {
  const WLinearProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LinearProgressIndicator(
      color: AppColors.deepPurple,
      backgroundColor: AppColors.lightPurple,
    );
  }
}
