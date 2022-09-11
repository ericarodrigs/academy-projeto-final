import 'package:flutter/material.dart';
import 'package:rarovideowall/src/shared/constants/app_colors.dart';
import 'package:rarovideowall/src/shared/constants/app_text_styles.dart';

class WFavorite extends StatelessWidget {
  const WFavorite({
    Key? key,
    required this.isFavorite,
    required this.onPressed,
  }) : super(key: key);

  final bool isFavorite;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          'Favoritar: ',
          style: TextStyles.black14BoldUrbanist,
        ),
        const SizedBox(
          width: 5,
        ),
        InkWell(
          onTap: onPressed,
          child: Icon(
            Icons.favorite,
            color: isFavorite ? AppColors.favorite : AppColors.lightPurple,
            size: 20,
          ),
        )
      ],
    );
  }
}
