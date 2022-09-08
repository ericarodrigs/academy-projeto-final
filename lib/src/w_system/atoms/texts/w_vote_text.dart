import 'package:flutter/material.dart';
import 'package:rarovideowall/src/shared/constants/app_colors.dart';
import 'package:rarovideowall/src/shared/constants/app_text_styles.dart';

class WVoteText extends StatelessWidget {
  const WVoteText({
    Key? key,
    required this.votes,
  }) : super(key: key);

  final int votes;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 15),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: AppColors.darkGrey, borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: Text(
          votes.toString(),
          style: TextStyles.black14BoldUrbanist,
        ),
      ),
    );
  }
}
