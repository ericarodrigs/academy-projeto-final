import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:rarovideowall/src/modules/home/features/details/controller/video_details_controller.dart';
import 'package:rarovideowall/src/w_system/molecules/w_error_reload.dart';
import 'package:rarovideowall/src/w_system/organisms/w_comment_list.dart';
import 'package:rarovideowall/src/w_system/organisms/w_comments_load.dart';

class WComment extends StatelessWidget {
  const WComment({
    Key? key,
    required this.videoDetailsController,
  }) : super(key: key);

  final VideoDetailsController videoDetailsController;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        switch (videoDetailsController.commentsState) {
          case LoadState.loading:
            return const WCommentsLoad();
          case LoadState.done:
            return WCommentList(
              userId: videoDetailsController.loggedState.user?.id ?? '',
              onDelete: (comment) =>
                  videoDetailsController.deleteComment(context, comment),
              onEdit: (_) {},
              onDownVote: (comment) {
                videoDetailsController.voteComment(context, comment.id, false);
              },
              onUpVote: (comment) {
                videoDetailsController.voteComment(context, comment.id, true);
              },
              comments: videoDetailsController.comments.toList(),
              hasImgAvatarError: videoDetailsController.hasImgAvatarError,
              onLoadImgAvatarError: (err, stackTrace) {
                videoDetailsController.onLoadImgAvatarError(
                  context,
                  err,
                  stackTrace,
                );
              },
              isLogged: videoDetailsController.loggedState.isLogged,
            );
          case LoadState.error:
            return WErrorReload(
              errorText: videoDetailsController.commentsError,
              onPressed: videoDetailsController.getComments,
            );
        }
      },
    );
  }
}
