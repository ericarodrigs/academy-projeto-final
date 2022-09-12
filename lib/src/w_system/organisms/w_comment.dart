import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rarovideowall/src/modules/home/features/details/controller/comments_controller/comments_controller.dart';

import 'package:rarovideowall/src/shared/constants/app_text_styles.dart';
import 'package:rarovideowall/src/shared/constants/load_states.dart';
import 'package:rarovideowall/src/w_system/atoms/widgets/w_divider.dart';
import 'package:rarovideowall/src/w_system/atoms/widgets/w_refresh_indicator.dart';
import 'package:rarovideowall/src/w_system/molecules/w_error_reload.dart';
import 'package:rarovideowall/src/w_system/molecules/w_new_comment.dart';
import 'package:rarovideowall/src/w_system/organisms/w_comment_list.dart';
import 'package:rarovideowall/src/w_system/organisms/w_comments_load.dart';

class WComment extends StatelessWidget {
  const WComment({
    Key? key,
    required this.commentController,
  }) : super(key: key);

  final CommentsController commentController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const WDivider(),
        Container(
          margin: const EdgeInsets.only(bottom: 8),
          child: const Text(
            'Comentários',
            style: TextStyles.black24w700Urbanist,
          ),
        ),
        Observer(
            name: 'NewComment',
            builder: (_) {
              return Visibility(
                visible: commentController.isLogged,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 0, 16),
                  child: WNewComment(
                    focusNode: commentController.focusNode,
                    onSend: () => commentController.sendComment(context),
                    onEdit: () => commentController.editComment(context),
                    onEditCancel: commentController.exitEditMode,
                    textController: commentController.textController,
                    isEditMode: commentController.isEditMode,
                    commentKey: commentController.commentsKey,
                  ),
                ),
              );
            }),
        Observer(
          builder: (context) {
            switch (commentController.commentsState) {
              case LoadState.loading:
                return const WCommentsLoad();
              case LoadState.success:
                return WRefreshIndicator(
                  onRefresh: commentController.getComments,
                  child: WCommentList(
                    userId: commentController.userId,
                    onDelete: (comment) =>
                        commentController.deleteComment(context, comment),
                    onEdit: commentController.enterEditMode,
                    onDownVote: (comment) {
                      commentController.voteComment(context, comment.id, false);
                    },
                    onUpVote: (comment) {
                      commentController.voteComment(context, comment.id, true);
                    },
                    comments: commentController.comments.toList(),
                    hasImgAvatarError: commentController.hasImgAvatarError,
                    onLoadImgAvatarError: (err, stackTrace) {
                      commentController.onLoadImgAvatarError(
                        context,
                        err,
                        stackTrace,
                      );
                    },
                    isLogged: commentController.isLogged,
                  ),
                );
              case LoadState.error:
                return WErrorReload(
                  errorText: commentController.commentsError,
                  onPressed: commentController.getComments,
                );
            }
          },
        ),
        const WDivider(),
      ],
    );
  }
}
