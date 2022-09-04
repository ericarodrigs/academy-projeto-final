import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:rarovideowall/src/shared/global_states/logged_state/logged_state.dart';
import 'package:rarovideowall/src/shared/global_states/videos_state/videos_state.dart';
import 'package:rarovideowall/src/shared/interfaces/api_service.dart';
import 'package:rarovideowall/src/shared/models/failure.dart';
import 'package:rarovideowall/src/shared/models/video_model.dart';

class VideosRepository {
  ApiService service;
  VideosState videosState;
  LoggedState loggedState;

  VideosRepository({
    required this.service,
    required this.videosState,
    required this.loggedState,
  });

  Future<VideoModel> getVideo(String id) async{
    Response response = await service.request('/videos/$id', 'GET');
    return VideoModel.fromMap(response.data);
  }

  Future<Either<Failure, List<VideoModel>>> getRelatedVideos(String topico) async {
    try {
      Response response = await service.request('/videos', 'GET', queryParams: {'topico': topico});
      List<dynamic> videos = response.data;
      List<VideoModel> newVideos = videos.map((video) => VideoModel.fromMap(video)).toList();
      videosState.syncVideos(newVideos);
      return Right(newVideos);
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

  Future<Either<Failure, List<VideoModel>>> getAllVideos() async {
    try {
      Response response = await service.request(
        '/videos',
        'GET',
        queryParams: {'pagina': 1, 'itensPorPagina': 100, 'orderBy': 'dataPublicacao', 'orderDirection': 'ASC'},
      );
      List<dynamic> videos = response.data;
      List<VideoModel> newVideos = videos.map((video) => VideoModel.fromMap(video)).toList();
      videosState.syncVideos(newVideos);
      return Right(newVideos);
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

  Future<Either<Failure, List<VideoModel>>> getFavoriteVideos() async {
    try {
      if (!loggedState.isLogged) {
        throw Failure('Usuário precisa estar logado.');
      }
      Response response = await service.request(
        '/videos/favoritos',
        'GET',
        queryParams: {'pagina': 1, 'itensPorPagina': 100, 'orderBy': 'dataPublicacao', 'orderDirection': 'ASC'},
      );
      List<dynamic> videos = response.data;
      List<VideoModel> favoriteVideos = videos.map((video) => VideoModel.fromMap(video)).toList();
      videosState.syncFavoriteVideos(favoriteVideos);
      return Right(favoriteVideos);
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

// Future<Either<Failure, List<VideoModel>>> getPublicVideos() async {
//   try {
//     Response response = await service.request(
//       '/videos',
//       'GET',
//       queryParams: {
//         'pagina': 1,
//         'itensPorPagina': 100,
//         'orderBy': 'dataPublicacao',
//         'orderDirection': 'ASC',
//       },
//       headers: {'Authorization': ''},
//     );
//     List<dynamic> videos = response.data;
//     List<VideoModel> publicVideos =
//         videos.map((video) => VideoModel.fromMap(video)).toList();
//     return Right(publicVideos);
//   } on Failure catch (fail) {
//     return Left(fail);
//   } catch (err, stackTrace) {
//     return Left(
//       Failure(
//         'Erro inesperado',
//         object: err,
//         stackTrace: stackTrace,
//       ),
//     );
//   }
// }

}
