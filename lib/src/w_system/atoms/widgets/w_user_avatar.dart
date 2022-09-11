import 'package:flutter/material.dart';
import 'package:rarovideowall/src/shared/constants/app_colors.dart';

import 'package:rarovideowall/src/shared/constants/app_text_styles.dart';
import 'package:rarovideowall/src/shared/models/user_model.dart';
import 'package:rarovideowall/src/w_system/atoms/progress_indicators/w_circular_progress_indicator.dart';

class WUserAvatar extends StatelessWidget {
  const WUserAvatar({
    Key? key,
    required this.user,
    this.isRight = false,
    this.onLoadError,
    this.hasError = false,
  }) : super(key: key);

  final UserModel user;
  final bool isRight;
  final void Function(Object?, StackTrace?)? onLoadError;

  final bool hasError;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment:
          isRight ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: isRight
          ? [
              Text(
                user.name,
                style: TextStyles.black16w700Urbanist,
              ),
              const SizedBox(
                width: 10,
              ),
              CircleAvatar(
                foregroundImage: NetworkImage(user.photo),
                onForegroundImageError: onLoadError,
                backgroundColor: Colors.transparent,
                radius: 20,
                child: hasError
                    ? const Icon(Icons.warning_amber, color: AppColors.black)
                    : const WCircularProgressIndicator(),
              ),
            ]
          : [
              CircleAvatar(
                foregroundImage: NetworkImage(user.photo),
                backgroundColor: Colors.transparent,
                onForegroundImageError: onLoadError,
                radius: 20,
                child: hasError
                    ? const Icon(Icons.warning_amber, color: AppColors.black)
                    : const WCircularProgressIndicator(),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                user.name,
                style: TextStyles.black16w700Urbanist,
              ),
            ],
    );
  }
}
