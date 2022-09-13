import 'package:flutter_test/flutter_test.dart';
import 'package:rarovideowall/src/modules/login_module/features/login/model/login_user_model.dart';
import 'package:rarovideowall/src/shared/global_states/logged_state/logged_state.dart';
import 'package:rarovideowall/src/shared/global_states/videos_state/videos_state.dart';
import 'package:rarovideowall/src/shared/interfaces/login_repository_interface.dart';
import 'package:rarovideowall/src/shared/interfaces/videos_repository_interface.dart';
import 'package:rarovideowall/src/shared/models/video_model.dart';
import 'package:rarovideowall/src/shared/repositories/login_repository.dart';
import 'package:rarovideowall/src/shared/repositories/videos_repository.dart';

import '../../../mocks/api_service_test/api_service_test.generate.dart';
import '../../../mocks/local_storage_service_test/local_storage_service_test.generate.dart';
import '../../../mocks/mock_data.dart';

void main() {
  late IVideosRepository videosRepository;
  late ILoginRepository loginRepository;

  setUpAll(() {
    final apiStubs = ApiServiceStubs();
    final localStorageStubs = LocalStorageServiceStubs();
    videosRepository = VideosRepository(
      loggedState: LoggedState.instance,
      videosState: VideosState.instance,
      service: apiStubs.mock,
    );
    loginRepository = LoginRepository(
      apiService: apiStubs.mock,
      localStorageService: localStorageStubs.mock,
      loggedState: LoggedState.instance,
    );
    apiStubs.registerStubs();
    localStorageStubs.registerStubs();
    apiStubs.registerStubs();
  });

  group('Test VideosRepository:', () {
    group('Not logged tests -', () {
      test('Should return a list of public videos when getAllVideos is called',
          () async {
        List<VideoModel> respVideos = publicVideos
            .map(
              (video) => VideoModel.fromMap(video),
            )
            .toList();
        (await videosRepository.getAllVideos()).fold(
          (l) => expect(l, null),
          (videos) => expect(videos, respVideos),
        );
      });
      test(
          'Should return a Failure with Usuário precisa estar logado. when getFavoriteVideos is called not logged',
          () async {
        (await videosRepository.getFavoriteVideos()).fold(
          (fail) => expect(fail.message, 'Usuário precisa estar logado.'),
          (r) => expect(r, null),
        );
      });
      test(
          'Should return a list with the firstVideo when getRecommendedVideos is called with firstVideoId',
          () async {
        List<VideoModel> respVideos = [VideoModel.fromMap(firstVideo)];
        (await videosRepository.getRecommendedVideos(firstVideoId)).fold(
          (l) => expect(l, null),
          (videos) => expect(videos, respVideos),
        );
      });
      test(
          'Should return the firstVideo when getVideo is called with firstVideoId',
          () async {
        VideoModel respVideos = VideoModel.fromMap(firstVideo);
        (await videosRepository.getVideo(firstVideoId)).fold(
          (l) => expect(l, null),
          (video) => expect(video, respVideos),
        );
      });
      test(
          'Should return a Failure with "Usuário precisa estar logado." when toggleFavorite is called not logged',
          () async {
        (await videosRepository.toggleFavorite(firstVideoId, isFavorite: true))
            .fold(
          (fail) => expect(fail.message, 'Usuário precisa estar logado.'),
          (r) => expect(r, null),
        );
        (await videosRepository.toggleFavorite(firstVideoId, isFavorite: false))
            .fold(
          (fail) => expect(fail.message, 'Usuário precisa estar logado.'),
          (r) => expect(r, null),
        );
      });
    });
    group('Logged tests -', () {
      test(
          'Should return a list with the firstVideo when getFavoriteVideos is called and isLogged and firstVideo is favorite',
          () async {
        await loginRepository.login(LoginUserModel(
          email: 'test',
          password: 'test',
        ));
        await videosRepository.toggleFavorite(firstVideoId, isFavorite: false);
        List<VideoModel> respVideos = [VideoModel.fromMap(firstVideo)];

        (await videosRepository.getFavoriteVideos()).fold(
          (l) => expect(l, null),
          (videos) => expect(videos, respVideos),
        );
      });

      test('Should return a boolean when toggleFavorite is called logged',
          () async {
        (await videosRepository.toggleFavorite(firstVideoId, isFavorite: true))
            .fold(
          (l) => expect(l, null),
          (r) => expect(r, true),
        );
        (await videosRepository.toggleFavorite(firstVideoId, isFavorite: false))
            .fold(
          (l) => expect(l, null),
          (r) => expect(r, true),
        );
      });
    });
  });
}
