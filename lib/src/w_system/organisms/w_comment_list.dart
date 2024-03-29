import 'package:flutter/material.dart';

import 'package:rarovideowall/src/modules/home/features/details/model/comment_model.dart';
import 'package:rarovideowall/src/shared/constants/app_text_styles.dart';
import 'package:rarovideowall/src/w_system/molecules/w_left_comment.dart';
import 'package:rarovideowall/src/w_system/molecules/w_right_comment.dart';

class WCommentList extends StatelessWidget {
  const WCommentList({
    Key? key,
    this.height = 170,
    required this.userId,
    required this.onDelete,
    required this.onEdit,
    required this.onDownVote,
    required this.onUpVote,
    required this.comments,
    this.onLoadImgAvatarError,
    this.hasImgAvatarError = false,
    this.isLogged = false,
  }) : super(key: key);

  final double height;
  final String userId;
  final void Function(CommentModel) onDelete;
  final void Function(CommentModel) onEdit;
  final void Function(CommentModel) onDownVote;
  final void Function(CommentModel) onUpVote;
  final List<CommentModel> comments;
  final void Function(Object?, StackTrace?)? onLoadImgAvatarError;
  final bool hasImgAvatarError;
  final bool isLogged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: comments.isEmpty
          ? const Center(
              child: Text(
                'Ainda não foi deixado nenhum comentário . . .\n Mas você pode ser o primeiro 😄',
                style: TextStyles.black16w700Urbanist,
                textAlign: TextAlign.center,
              ),
            )
          : _listView(),
    );
  }

  Widget _listView() => ListView.builder(
        itemCount: comments.length,
        itemBuilder: (_, index) {
          bool isLoggedUser = comments[index].student.id == userId;
          return isLoggedUser
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: WRightComment(
                    onDelete: () => onDelete(comments[index]),
                    onEdit: () => onEdit(comments[index]),
                    comment: comments[index],
                    onDownVote: () {
                      onDownVote(comments[index]);
                    },
                    onUpVote: () {
                      onUpVote(comments[index]);
                    },
                    onLoadImgAvatarError: onLoadImgAvatarError,
                    hasImgAvatarError: hasImgAvatarError,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: WLeftComment(
                    comment: comments[index],
                    onDownVote: () {
                      onDownVote(comments[index]);
                    },
                    onUpVote: () {
                      onUpVote(comments[index]);
                    },
                    hasImgAvatarError: hasImgAvatarError,
                    onLoadImgAvatarError: onLoadImgAvatarError,
                    isLogged: isLogged,
                  ),
                );
        },
      );
}
