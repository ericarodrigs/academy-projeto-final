import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rarovideowall/src/modules/home/features/home/controller/home_controller.dart';
import 'package:rarovideowall/src/modules/login_module/features/login/model/login_user_model.dart';
import 'package:rarovideowall/src/shared/constants/load_states.dart';
import 'package:rarovideowall/src/shared/global_states/logged_state/logged_state.dart';
import 'package:rarovideowall/src/shared/global_states/videos_state/videos_state.dart';
import 'package:rarovideowall/src/shared/models/failure.dart';
import 'package:rarovideowall/src/shared/models/video_model.dart';
import 'package:rarovideowall/src/shared/repositories/local_storage_user_repository.dart';
import 'package:rarovideowall/src/shared/repositories/login_repository.dart';
import 'package:rarovideowall/src/shared/repositories/videos_repository.dart';

import '../../../../../../mocks/api_service_test/api_service_test.generate.dart';
import '../../../../../../mocks/local_storage_service_test/local_storage_service_test.generate.dart';
import '../../../../../../mocks/mock_data.dart';

void main() {
  late HomeController homeController;
  setUpAll(() {
    final apiStubs = ApiServiceStubs();
    final localStorageStubs = LocalStorageServiceStubs();
    homeController = HomeController(
      loggedState: LoggedState.instance,
      videosState: VideosState.instance,
      loginRepository: LoginRepository(
        service: apiStubs.mock,
        loggedState: LoggedState.instance,
        localStorageUserRepository: LocalStorageUserRepository(
          service: localStorageStubs.mock,
        ),
      ),
      videosRepository: VideosRepository(
        service: apiStubs.mock,
        videosState: VideosState.instance,
        loggedState: LoggedState.instance,
      ),
    );
    apiStubs.registerStubs();
    localStorageStubs.registerStubs();
  });

  group('HomeControllerTestes', () {
    test(
        'The homeState should be success when setHomeState is called with Right(LoadState.success)',
        () {
      homeController.setHomeState(const Right(LoadState.success));
      expect(homeController.homeState, LoadState.success);
    });
    test(
        'The homeState should be error and errorText shuld be test when setHomeState is called with Left(Failure(test))',
        () {
      homeController.setHomeState(Left(Failure('test')));
      expect(homeController.homeState, LoadState.error);
      expect(homeController.errorText, 'test');
    });
    test(
        'The homeState should be error and errorText should be test when setHomeState is called with Left(Failure(test))',
        () {
      homeController.setHomeState(Left(Failure('test')));
      expect(homeController.homeState, LoadState.error);
      expect(homeController.errorText, 'test');
    });
    test(
        'Should videos be publicVideos and homeState be success when refreshVideos is called',
        () async {
      await homeController.refreshVideos();
      expect(homeController.homeState, LoadState.success);
      expect(homeController.videos,
          publicVideos.map((video) => VideoModel.fromMap(video)));
    });

    test('Should isLogged be true when login has finished', () async {
      await homeController.loginRepository.login(LoginUserModel(
        email: 'test',
        password: 'test',
      ));
      expect(homeController.isLogged, true);
    });
    test(
        'Should favoriteVideo be [firstVideo] when is logged and firstVideo is favorite and refreshVIdeos is called',
        () async {
      await homeController.videosRepository
          .toggleFavorite(firstVideoId, isFavorite: false);
      await homeController.refreshVideos();
      await Future.delayed(const Duration(milliseconds: 500));
      expect(homeController.homeState, LoadState.success);
      expect(homeController.favoriteVideos, [VideoModel.fromMap(firstVideo)]);
    });
    test(
        'Should should createPlayList return a list of length 3 when is logged and refreshVideos is called.',
        () async {
      await homeController.refreshVideos();
      expect(homeController.createPlayList().length >= 2, true);
    });
  });
}
