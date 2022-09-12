import 'package:flutter/material.dart';
import 'package:rarovideowall/src/shared/constants/app_colors.dart';

class WRefreshIndicator extends StatelessWidget {
  const WRefreshIndicator({
    Key? key,
    required this.onRefresh,
    required this.child,
  }) : super(key: key);

  final Future<void> Function() onRefresh;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Colors.white,
      backgroundColor: AppColors.purpleTitle,
      onRefresh: onRefresh,
      child: child,
    );
  }
}
