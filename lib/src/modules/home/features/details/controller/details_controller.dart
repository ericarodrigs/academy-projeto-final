import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rarovideowall/src/modules/home/features/details/controller/comments_controller/comments_controller.dart';
import 'package:rarovideowall/src/modules/home/features/details/controller/video_controller/video_controller.dart';
import 'package:rarovideowall/src/shared/constants/show_popups.dart';
import 'package:rarovideowall/src/w_system/molecules/w_comment_instruction.dart';

class DetailsController {
  CommentsController commentsController;
  VideoController videoController;

  DetailsController({
    required this.commentsController,
    required this.videoController,
  });

  void initState(String videoId) {
    videoController.initState(videoId);
    commentsController.initState(videoId);
  }

  void showInfoCard(BuildContext context) {
    ShowPopups.showInfoDialog(
      context,
      () {
        Modular.to.pop();
      },
      title: 'Informações',
      content: const WCommentInstruction(),
    );
  }
}
