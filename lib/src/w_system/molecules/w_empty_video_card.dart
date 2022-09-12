import 'package:flutter/material.dart';
import 'package:rarovideowall/src/shared/constants/app_colors.dart';
import 'package:rarovideowall/src/shared/constants/app_text_styles.dart';

class WEmptyVideosCard extends StatelessWidget {
  const WEmptyVideosCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 60),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.purple, width: 1),
        borderRadius: BorderRadius.circular(8),
        color: AppColors.cardColor,
      ),
      child: const Center(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Text(
            'Parece que ainda não existe nenhuma aula . . .',
            style: TextStyles.black16w700Urbanist,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
