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
  }) : super(key: key);

  final CommentModel comment;
  final Null Function() onDownVote;
  final Null Function() onUpVote;
  final void Function(Object?, StackTrace?)? onLoadImgAvatarError;
  final bool hasImgAvatarError;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WUserAvatar(
          user: comment.aluno,
          onLoadError: onLoadImgAvatarError,
          hasError: hasImgAvatarError,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 5, 24, 0),
          child: Stack(
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(
                  minHeight: 50,
                  minWidth: 60,
                ),
                child: Text(
                  comment.texto,
                  style: TextStyles.black14w400Urbanist,
                ),
              ),
              Positioned(
                right: 0,
                bottom: 2,
                child: WVoteButton(
                  onDownVote: onDownVote,
                  onUpVote: onUpVote,
                  downVotes: comment.downVotes,
                  upVotes: comment.upVotes,
                  mainAxisAlignment: MainAxisAlignment.end,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
