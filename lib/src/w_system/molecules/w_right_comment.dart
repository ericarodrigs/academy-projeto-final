import 'package:flutter/material.dart';

import 'package:rarovideowall/src/modules/home/features/details/model/comment_model.dart';
import 'package:rarovideowall/src/shared/constants/app_text_styles.dart';
import 'package:rarovideowall/src/w_system/atoms/buttons/w_vote_button.dart';
import 'package:rarovideowall/src/w_system/atoms/widgets/w_user_avatar.dart';

class WRightComment extends StatelessWidget {
  const WRightComment({
    Key? key,
    required this.comment,
    required this.onDownVote,
    required this.onUpVote,
    this.onLoadImgAvatarError,
    this.hasImgAvatarError = false,
    required this.onDelete,
    required this.onEdit,
  }) : super(key: key);

  final CommentModel comment;
  final Null Function() onDownVote;
  final Null Function() onUpVote;
  final void Function(Object?, StackTrace?)? onLoadImgAvatarError;
  final bool hasImgAvatarError;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            WVoteButton(
              onDownVote: onDownVote,
              onUpVote: onUpVote,
              downVotes: comment.downVotes,
              upVotes: comment.upVotes,
              mainAxisAlignment: MainAxisAlignment.end,
              isLogged: true,
            ),
            const SizedBox(width: 18),
            InkWell(
              onLongPress: onDelete,
              child: WUserAvatar(
                user: comment.student,
                isRight: true,
                onLoadError: onLoadImgAvatarError,
                hasError: hasImgAvatarError,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 6, 24, 0),
          child: InkWell(
            onLongPress: onEdit,
            child: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 20),
              child: Text(
                comment.text,
                style: TextStyles.black14w400Urbanist,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
