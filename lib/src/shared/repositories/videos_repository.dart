import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:rarovideowall/src/shared/global_states/logged_state/logged_state.dart';
import 'package:rarovideowall/src/shared/global_states/videos_state/videos_state.dart';
import 'package:rarovideowall/src/shared/interfaces/api_service.dart';
import 'package:rarovideowall/src/shared/interfaces/videos_repository_interface.dart';
import 'package:rarovideowall/src/shared/models/failure.dart';
import 'package:rarovideowall/src/shared/models/video_model.dart';

class VideosRepository implements IVideosRepository {
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

  @override
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
      log(fail.message);
      return Left(fail);
    } catch (err, stackTrace) {
      log('Erro inesperado ao buscar videos');
      log(stackTrace.toString());
      return Left(Failure(
        'Erro inesperado ao buscar videos',
        object: err,
        stackTrace: stackTrace,
      ));
    }
  }

  @override
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
      log(fail.message);
      return Left(fail);
    } catch (err, stackTrace) {
      log('Erro inesperado ao buscar favoritos.');
      log(stackTrace.toString());
      return Left(Failure(
        'Erro inesperado ao buscar favoritos.',
        object: err,
        stackTrace: stackTrace,
      ));
    }
  }

  @override
  Future<Either<Failure, List<VideoModel>>> getRecommendedVideos(
      String videoId) async {
    try {
      Response response = await service.request(
        '/videos/$videoId/recomendacoes',
        'GET',
        queryParams: {
          'itensPorPagina': 10,
        },
      );
      List<dynamic> videos = response.data;
      return Right(videos.map((video) => VideoModel.fromMap(video)).toList());
    } on Failure catch (fail) {
      log(fail.message);
      return Left(fail);
    } catch (err, stackTrace) {
      log('Erro inesperado ao buscar recomendações');
      log(stackTrace.toString());
      return Left(
        Failure(
          'Erro inesperado ao buscar recomendações',
          object: err,
          stackTrace: stackTrace,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, VideoModel>> getVideo(String videoId) async {
    try {
      Response response = await service.request(
        '/videos/$videoId',
        'GET',
      );
      return Right(VideoModel.fromMap(response.data));
    } on Failure catch (fail) {
      log(fail.message);
      return Left(fail);
    } catch (err, stackTrace) {
      log('Erro inesperado ao buscar video');
      log(stackTrace.toString());
      return Left(
        Failure(
          'Erro inesperado ao buscar video.',
          object: err,
          stackTrace: stackTrace,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> toggleFavorite(
    String videoId, {
    required bool isFavorite,
  }) async {
    try {
      if (!loggedState.isLogged) {
        throw Failure('Usuário precisa estar logado.');
      }
      late Response response;
      if (isFavorite) {
        response = await service.request(
          '/videos/$videoId/favoritos',
          'DELETE',
        );
      } else {
        response = await service.request(
          '/videos/$videoId/favoritos',
          'POST',
        );
      }
      return Right(response.statusCode == 204);
    } on Failure catch (fail) {
      log(fail.message);
      return Left(fail);
    } catch (err, stackTrace) {
      log('Erro inesperado ao alternar video favorito. IsFavorite: $isFavorite');
      log(stackTrace.toString());
      return Left(
        Failure(
          'Erro inesperado ao alternar video favorito.',
          object: err,
          stackTrace: stackTrace,
        ),
      );
    }
  }
}
