import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:rarovideowall/src/modules/home/features/details/controller/video_details_controller.dart';
import 'package:rarovideowall/src/shared/constants/app_text_styles.dart';
import 'package:rarovideowall/src/shared/constants/load_states.dart';
import 'package:rarovideowall/src/w_system/atoms/widgets/w_divider.dart';
import 'package:rarovideowall/src/w_system/molecules/w_error_reload.dart';
import 'package:rarovideowall/src/w_system/molecules/w_new_comment.dart';
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
                visible: videoDetailsController.loggedState.isLogged,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 16),
                  child: WNewComment(
                    onSend: () => videoDetailsController.sendComment(context),
                    onEdit: () => videoDetailsController.editComment(context),
                    onEditCancel: videoDetailsController.exitEditMode,
                    textController: videoDetailsController.textController,
                    isEditMode: videoDetailsController.isEditMode,
                    commentKey: videoDetailsController.commentsKey,
                  ),
                ),
              );
            }),
        Observer(
          builder: (context) {
            switch (videoDetailsController.commentsState) {
              case LoadState.loading:
                return const WCommentsLoad();
              case LoadState.success:
                return WCommentList(
                  userId: videoDetailsController.loggedState.user?.id ?? '',
                  onDelete: (comment) =>
                      videoDetailsController.deleteComment(context, comment),
                  onEdit: videoDetailsController.enterEditMode,
                  onDownVote: (comment) {
                    videoDetailsController.voteComment(
                        context, comment.id, false);
                  },
                  onUpVote: (comment) {
                    videoDetailsController.voteComment(
                        context, comment.id, true);
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
        ),
        const WDivider(),
      ],
    );
  }
}
