import 'package:flutter/material.dart';
import 'package:rarovideowall/src/shared/constants/app_colors.dart';

class WAppBar extends StatelessWidget with PreferredSizeWidget {
  const WAppBar({
    Key? key,
    this.actions,
  }) : super(key: key);

  final List<Widget>? actions;

  @override
  Size get preferredSize => const Size(double.infinity, 40);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.backGroundPageColor,
      foregroundColor: AppColors.black,
      actions: actions,
    );
  }
}
