import 'package:flutter/material.dart';

import 'package:rarovideowall/src/shared/constants/app_colors.dart';
import 'package:rarovideowall/src/w_system/atoms/texts/w_vote_text.dart';

class WVoteButton extends StatelessWidget {
  const WVoteButton({
    Key? key,
    required this.onDownVote,
    required this.onUpVote,
    required this.downVotes,
    required this.upVotes,
    required this.isLogged,
    required this.myVoteIsUp,
    this.mainAxisAlignment = MainAxisAlignment.start,
  }) : super(key: key);

  final bool? myVoteIsUp;
  final VoidCallback onDownVote;
  final VoidCallback onUpVote;
  final int downVotes;
  final int upVotes;
  final MainAxisAlignment mainAxisAlignment;
  final bool isLogged;

  final double iconSize = 25;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        InkWell(
          onTap: isLogged ? onUpVote : null,
          child: Icon(
            myVoteIsUp == true ? Icons.thumb_up : Icons.thumb_up_alt_outlined,
            color: upVotes > 0 ? AppColors.deepPurple : AppColors.black,
            size: iconSize,
          ),
        ),
        const SizedBox(width: 5),
        WVoteText(votes: upVotes),
        const SizedBox(width: 5),
        InkWell(
          onTap: isLogged ? onDownVote : null,
          child: Icon(
            myVoteIsUp == false
                ? Icons.thumb_down
                : Icons.thumb_down_alt_outlined,
            color: downVotes > 0 ? AppColors.favorite : AppColors.black,
            size: iconSize,
            textDirection: TextDirection.rtl,
          ),
        ),
        const SizedBox(width: 5),
        WVoteText(votes: downVotes),
      ],
    );
  }
}
