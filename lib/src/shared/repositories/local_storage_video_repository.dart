import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:rarovideowall/src/shared/constants/keys_storage.dart';

import 'package:rarovideowall/src/shared/global_states/videos_state/videos_state.dart';
import 'package:rarovideowall/src/shared/interfaces/local_storage_service.dart';
import 'package:rarovideowall/src/shared/models/failure.dart';
import 'package:rarovideowall/src/shared/models/video_model.dart';

class LocalStorageVideoRepository {
  LocalStorageService service;
  VideosState videosState;

  LocalStorageVideoRepository({
    required this.service,
    required this.videosState,
  });

  Future<Either<Failure, List<VideoModel>>> loadAll() async {
    try {
      String? videos = await service.read(KeysStorage.history);
      if (videos == null) {
        videosState.syncHistoryVideos([]);
        return const Right([]);
      } else {
        List<dynamic> videosDecoded = jsonDecode(videos);
        List<VideoModel> auxVideos = videosDecoded
            .map(
              (videoJson) => VideoModel.fromJson(videoJson),
            )
            .toList();
        videosState.syncHistoryVideos(auxVideos);
        return Right(auxVideos);
      }
    } catch (err, stackTrace) {
      return Left(Failure(err.toString(), object: err, stackTrace: stackTrace));
    }
  }

  Future<Either<Failure, void>> save(VideoModel newVideo) async {
    try {
      List<VideoModel> auxVideos = videosState.history;
      if (!auxVideos.contains(newVideo)) {
        auxVideos.add(newVideo);
        if (auxVideos.length > 10) {
          auxVideos.removeAt(0);
        }
      } else {
        auxVideos.remove(newVideo);
        auxVideos.add(newVideo);
      }
      videosState.syncHistoryVideos(auxVideos);
      service.save(KeysStorage.history, jsonEncode(auxVideos));
      return const Right(null);
    } catch (err, stackTrace) {
      return Left(Failure(err.toString(), object: err, stackTrace: stackTrace));
    }
  }
}
