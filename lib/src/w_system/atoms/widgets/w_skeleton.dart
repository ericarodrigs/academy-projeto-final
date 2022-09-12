import 'package:flutter/material.dart';
import 'package:rarovideowall/src/shared/constants/app_colors.dart';

class WSkeleton extends StatelessWidget {
  const WSkeleton({
    Key? key,
    this.width,
    required this.height,
  }) : super(key: key);
  final double? width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              AppColors.deepPurple.withOpacity(0.15),
              AppColors.lightPurple.withOpacity(0.1),
            ],
          ),
          borderRadius: const BorderRadius.all(Radius.circular(16))),
    );
  }
}
