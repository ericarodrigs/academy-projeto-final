import 'package:rarovideowall/src/shared/models/video_model.dart';

class PlayListContent {
  final String name;
  final List<VideoModel> videos;
  PlayListContent({
    required this.name,
    required this.videos,
  });
}
