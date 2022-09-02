import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:rarovideowall/src/shared/global_states/videos_state/videos_state.dart';
import 'package:rarovideowall/src/shared/interfaces/api_service.dart';
import 'package:rarovideowall/src/shared/models/failure.dart';
import 'package:rarovideowall/src/shared/models/video_model.dart';

class VideosRepository {
  ApiService service;
  VideosState videosState;

  VideosRepository({
    required this.service,
    required this.videosState,
  });

  Future<Either<Failure, List<VideoModel>>> getAll() async {
    try {
      Response response = await service.request('/videos', 'GET', queryParams: {
        'pagina': 1,
        'itensPorPagina': 100,
        'orderBy': 'dataPublicacao',
        'orderDirection': 'ASC',
      });
      List<dynamic> videos = response.data;
      List<VideoModel> allVideos =
          videos.map((video) => VideoModel.fromMap(video)).toList();
      videosState.syncVideos(allVideos);
      return Right(allVideos);
    } on Failure catch (fail) {
      return Left(fail);
    } catch (err, stackTrace) {
      return Left(
        Failure(
          'Erro inesperado',
          object: err,
          stackTrace: stackTrace,
        ),
      );
    }
  }
}
