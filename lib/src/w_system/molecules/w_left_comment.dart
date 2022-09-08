import 'package:flutter/material.dart';

import 'package:rarovideowall/src/modules/home/features/details/model/comment_model.dart';
import 'package:rarovideowall/src/shared/constants/app_text_styles.dart';
import 'package:rarovideowall/src/w_system/atoms/buttons/w_vote_button.dart';
import 'package:rarovideowall/src/w_system/atoms/widgets/w_user_avatar.dart';

class WLeftComment extends StatelessWidget {
  const WLeftComment({
    Key? key,
    required this.comment,
    required this.onDownVote,
    required this.onUpVote,
    this.onLoadImgAvatarError,
    this.hasImgAvatarError = false,
    this.isLogged = false,
  }) : super(key: key);

  final CommentModel comment;
  final Null Function() onDownVote;
  final Null Function() onUpVote;
  final void Function(Object?, StackTrace?)? onLoadImgAvatarError;
  final bool hasImgAvatarError;
  final bool isLogged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            WUserAvatar(
              user: comment.aluno,
              onLoadError: onLoadImgAvatarError,
              hasError: hasImgAvatarError,
            ),
            const SizedBox(width: 18),
            WVoteButton(
              onDownVote: onDownVote,
              onUpVote: onUpVote,
              downVotes: comment.downVotes,
              upVotes: comment.upVotes,
              mainAxisAlignment: MainAxisAlignment.end,
              isLogged: isLogged,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 6, 30, 0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 20),
            child: Text(
              comment.texto,
              style: TextStyles.black14w400Urbanist,
            ),
          ),
        ),
      ],
    );
  }
}
