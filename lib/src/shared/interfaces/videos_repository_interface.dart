import 'package:dartz/dartz.dart';
import 'package:rarovideowall/src/shared/models/failure.dart';
import 'package:rarovideowall/src/shared/models/video_model.dart';

abstract class IVideosRepository {
  Future<Either<Failure, List<VideoModel>>> getAllVideos();

  Future<Either<Failure, List<VideoModel>>> getFavoriteVideos();

  Future<Either<Failure, List<VideoModel>>> getRecommendedVideos(
      String videoId);

  Future<Either<Failure, VideoModel>> getVideo(String videoId);

  Future<Either<Failure, bool>> toggleFavorite(
    String videoId, {
    required bool isFavorite,
  });
}
