import 'package:dio/dio.dart';
import 'package:rarovideowall/src/shared/interfaces/api_service.dart';
import 'package:rarovideowall/src/shared/models/data_models/video_model.dart';

class VideosRepository {
  ApiService service;

  VideosRepository({
    required this.service,
  });

  Future<List<VideoModel>> getAll() async {
    Response response = await service.request('/videos', 'GET', queryParams: {
      'pagina': 1,
      'itensPorPagina': 100,
      'orderBy': 'dataPublicacao',
      'orderDirection': 'ASC',
    });
    List<dynamic> videos = response.data;
    return videos.map((video) => VideoModel.fromMap(video)).toList();
  }
}
