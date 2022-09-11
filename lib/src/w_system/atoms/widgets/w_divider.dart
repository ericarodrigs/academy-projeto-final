import 'package:flutter/material.dart';
import 'package:rarovideowall/src/shared/constants/app_colors.dart';

class WDivider extends StatelessWidget {
  const WDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 30,
      thickness: 2,
      color: AppColors.lightPurple,
    );
  }
}
