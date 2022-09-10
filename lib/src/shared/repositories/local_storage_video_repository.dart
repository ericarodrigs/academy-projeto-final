import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:rarovideowall/src/shared/constants/keys_storage.dart';
import 'package:rarovideowall/src/shared/interfaces/local_storage_service.dart';

import 'package:rarovideowall/src/shared/models/failure.dart';
import 'package:rarovideowall/src/shared/models/video_model.dart';

class LocalStorageVideoRepository {
  LocalStorageService service;

  LocalStorageVideoRepository({
    required this.service,
  });

  Future<Either<Failure, List<VideoModel>>> get(String key) async {
    try {
      String? videosJson = await service.read(key);

      if (videosJson != null) {
        var decodeVideos = jsonDecode(videosJson) as List;
        List<VideoModel> videos = decodeVideos
            .map((videosJ) => VideoModel.fromJson(videosJ))
            .toList();

        return Right(videos);
      } else {
        return Left(Failure('Usuário não encontrado.'));
      }
    } catch (err, stackTrace) {
      return Left(Failure(err.toString(), object: err, stackTrace: stackTrace));
    }
  }

  Future<Either<Failure, void>> save(String key, VideoModel video) async {
    try {
      List<VideoModel> videos = [];
      (await get(KeysStorage.history)).fold(
          (error) => null, (videosStorage) async => {videos = videosStorage});

      if (videos.length == 5) {
        videos.removeAt(0);
      }
      videos.removeWhere((v) =>
          v.id == video.id &&
          v.name == v.name &&
          v.description == video.description);
      videos.add(video);
      await service.save(key, jsonEncode(videos));
      return const Right(null);
    } catch (err, stackTrace) {
      return Left(Failure(err.toString(), object: err, stackTrace: stackTrace));
    }
  }

  Future<Either<Failure, void>> saveAll(
      String key, List<VideoModel> videos) async {
    try {
      await service.save(key, jsonEncode(videos));
      return const Right(null);
    } catch (err, stackTrace) {
      return Left(Failure(err.toString(), object: err, stackTrace: stackTrace));
    }
  }

  Future<Either<Failure, void>> deleteAll() async {
    try {
      await service.deleteAll();
      return const Right(null);
    } catch (err, stackTrace) {
      return Left(Failure(err.toString(), object: err, stackTrace: stackTrace));
    }
  }
}
