import 'package:flutter/material.dart';
import 'package:rarovideowall/src/shared/constants/app_colors.dart';
import 'package:rarovideowall/src/shared/constants/app_text_styles.dart';
import 'package:rarovideowall/src/shared/models/user_model.dart';
import 'package:rarovideowall/src/w_system/atoms/progress_indicators/w_circular_progress_indicator.dart';

class WDrawerHeader extends StatelessWidget {
  const WDrawerHeader({
    Key? key,
    required this.user,
    this.onLoadError,
    this.hasError = false,
  }) : super(key: key);

  final UserModel? user;
  final void Function(Object?, StackTrace?)? onLoadError;
  final bool hasError;

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: const BoxDecoration(
        color: AppColors.purpleTitle,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            foregroundImage: user != null
                ? NetworkImage(user!.photo)
                : const AssetImage('assets/images/capelo.png') as ImageProvider,
            onForegroundImageError: onLoadError,
            backgroundColor: Colors.transparent,
            radius: 40,
            child: hasError
                ? const Icon(Icons.warning_amber, color: Colors.white)
                : const WCircularProgressIndicator(),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            user != null ? user!.name : 'Raro Academy',
            style: TextStyles.white30w700Urbanist,
          ),
        ],
      ),
    );
  }
}
