import 'package:flutter/material.dart';
import 'package:rarovideowall/src/shared/constants/app_colors.dart';

import 'package:rarovideowall/src/shared/constants/app_text_styles.dart';
import 'package:rarovideowall/src/shared/models/user_model.dart';

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
                foregroundImage: NetworkImage(user.foto),
                onForegroundImageError: onLoadError,
                backgroundColor: Colors.transparent,
                radius: 20,
                child: hasError
                    ? const Icon(Icons.warning_amber, color: AppColors.black)
                    : const CircularProgressIndicator(),
              ),
            ]
          : [
              CircleAvatar(
                foregroundImage: NetworkImage(user.foto),
                backgroundColor: Colors.transparent,
                onForegroundImageError: onLoadError,
                radius: 20,
                child: hasError
                    ? const Icon(Icons.warning_amber, color: AppColors.black)
                    : const CircularProgressIndicator(),
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
