import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:rarovideowall/src/shared/interfaces/api_service.dart';
import 'package:rarovideowall/src/shared/models/data_models/video_model.dart';
import 'package:rarovideowall/src/shared/models/failure.dart';

class VideosRepository {
  ApiService service;

  VideosRepository({
    required this.service,
  });

  Future<Either<Failure, List<VideoModel>>> getAll() async {
    try {
      Response response = await service.get('/videos', queryParams: {
        'pagina': 1,
        'itensPorPagina': 100,
        'orderBy': 'dataPublicacao',
        'orderDirection': 'ASC',
      });
      List<dynamic> videos = response.data;
      return Right(videos.map((video) => VideoModel.fromMap(video)).toList());
    } on DioError catch (err, stackTrace) {
      return Left(Failure(
          message: err.message, object: err.response, stackTrace: stackTrace));
    } on DioErrorType catch (err, stackTrace) {
      return Left(
          Failure(message: err.name, object: err, stackTrace: stackTrace));
    } catch (err, stackTrace) {
      return Left(Failure(
          message: err.toString(), object: err, stackTrace: stackTrace));
    }
  }
}
