import 'package:rarovideowall/src/modules/home/features/details/controller/comments_controller/comments_controller.dart';
import 'package:rarovideowall/src/modules/home/features/details/controller/video_controller/video_controller.dart';

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
}
