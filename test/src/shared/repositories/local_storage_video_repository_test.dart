import 'package:flutter_test/flutter_test.dart';
import 'package:rarovideowall/src/shared/global_states/videos_state/videos_state.dart';
import 'package:rarovideowall/src/shared/interfaces/local_storage_video_repository_interface.dart';
import 'package:rarovideowall/src/shared/models/video_model.dart';
import 'package:rarovideowall/src/shared/repositories/local_storage_video_repository.dart';

import '../../../mocks/local_storage_service_test/local_storage_service_test.generate.dart';
import '../../../mocks/mock_data.dart';

void main() {
  late ILocalStorageVideoRepository storageRepository;
  late LocalStorageServiceStubs storageStubs;
  setUpAll(() {
    storageStubs = LocalStorageServiceStubs();

    storageStubs.registerStubs();
    storageRepository = LocalStorageVideoRepository(
      service: storageStubs.mock,
      videosState: VideosState.instance,
    );
  });

  group('Test localStorageVideoRepository:', () {
    test(
        'Should return a empty list when loadAll is called without to save after.',
        () async {
      (await storageRepository.loadAll()).fold(
        (l) => expect(l, null),
        (videos) => expect(videos, []),
      );
    });
    test(
        'Should videoState.history be the first video when save is called with firstVideo.',
        () async {
      (await storageRepository.save(VideoModel.fromMap(firstVideo))).fold(
        (l) => expect(l, null),
        (r) => null,
      );
      expect(VideosState.instance.history, [VideoModel.fromMap(firstVideo)]);
    });
  });
}
