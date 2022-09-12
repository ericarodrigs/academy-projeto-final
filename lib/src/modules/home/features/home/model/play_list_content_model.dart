import 'package:rarovideowall/src/shared/models/video_model.dart';

class PlayListContentModel {
  final String name;
  final List<VideoModel> videos;
  PlayListContentModel({
    required this.name,
    required this.videos,
  });
}
