import 'package:flutter/material.dart';

import 'package:rarovideowall/src/shared/constants/app_colors.dart';

class WVoteButton extends StatelessWidget {
  const WVoteButton({
    Key? key,
    required this.onDownVote,
    required this.onUpVote,
    required this.downVotes,
    required this.upVotes,
    this.mainAxisAlignment = MainAxisAlignment.start,
  }) : super(key: key);

  final VoidCallback onDownVote;
  final VoidCallback onUpVote;
  final int downVotes;
  final int upVotes;
  final MainAxisAlignment mainAxisAlignment;

  final double maxWidth = 20;
  final double iconSize = 22;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        IconButton(
          constraints: BoxConstraints(maxWidth: maxWidth),
          iconSize: iconSize,
          onPressed: onDownVote,
          icon: Icon(
            Icons.thumb_down_alt_outlined,
            color: downVotes > 0 ? AppColors.favorite : AppColors.black,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        IconButton(
          constraints: BoxConstraints(maxWidth: maxWidth),
          iconSize: iconSize,
          onPressed: onUpVote,
          icon: Icon(
            Icons.thumb_up_alt_outlined,
            color: upVotes > 0 ? AppColors.deepPurple : AppColors.black,
          ),
        ),
      ],
    );
  }
}
