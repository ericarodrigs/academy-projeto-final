// ignore_for_file: prefer_function_declarations_over_variables

import 'package:dartz/dartz.dart' show Either;
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:rarovideowall/src/modules/home/features/details/model/comment_model.dart';
import 'package:rarovideowall/src/modules/home/interfaces/comment_repository_interface.dart';
import 'package:rarovideowall/src/shared/constants/app_colors.dart';
import 'package:rarovideowall/src/shared/constants/app_text_styles.dart';
import 'package:rarovideowall/src/shared/global_states/logged_state/logged_state.dart';
import 'package:rarovideowall/src/shared/models/failure.dart';
import 'package:rarovideowall/src/w_system/atoms/buttons/w_vote_button.dart';
import 'package:rarovideowall/src/w_system/atoms/widgets/w_user_avatar.dart';
import 'package:rarovideowall/src/w_system/molecules/w_left_comment.dart';
import 'package:rarovideowall/src/w_system/molecules/w_right_comment.dart';
import 'package:rarovideowall/src/w_system/organisms/w_comment_list.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({
    Key? key,
    required this.videoId,
  }) : super(key: key);

  final String videoId;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  ICommentRepository commentRepository = Modular.get();

  LoggedState loggedState = Modular.get();

  Future<Either<Failure, List<CommentModel>>> get() async {
    return (await commentRepository.getComments(widget.videoId));
  }

  void onUpVote(CommentModel comment) {
    commentRepository.voteComment(
      widget.videoId,
      comment.id,
      isUpVote: true,
    );
    setState(() {});
  }

  void onDownVote(CommentModel comment) {
    commentRepository.voteComment(
      widget.videoId,
      comment.id,
      isUpVote: false,
    );
    setState(() {});
  }

  void onLongPress(CommentModel comment) {
    commentRepository.deleteComment(widget.videoId, comment.id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: get(),
          builder: (
            _,
            AsyncSnapshot<Either<Failure, List<CommentModel>>> snapshot,
          ) {
            if (snapshot.connectionState == ConnectionState.done) {
              final userId = loggedState.user?.id ?? '';
              return snapshot.data!.fold(
                (fail) => const Center(child: Text('Deu erro!')),
                (comments) => Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 44.0),
                    child: WCommentList(
                      comments: comments,
                      userId: userId,
                      onLongPress: onLongPress,
                      onDownVote: onDownVote,
                      onUpVote: onUpVote,
                      onLoadImgAvatarError: (_, __) {
                        debugPrint('Ouve um erro ao carregar imagem');
                      },
                      hasImgAvatarError: false,
                    ),
                  ),
                ),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
