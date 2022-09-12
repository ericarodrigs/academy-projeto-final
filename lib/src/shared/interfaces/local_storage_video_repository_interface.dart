import 'package:dartz/dartz.dart';
import 'package:rarovideowall/src/shared/models/failure.dart';
import 'package:rarovideowall/src/shared/models/video_model.dart';

abstract class ILocalStorageVideoRepository {
  Future<Either<Failure, List<VideoModel>>> loadAll();

  Future<Either<Failure, void>> save(VideoModel newVideo);
}
