import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:rarovideowall/src/modules/home/features/home/controller/home_controller.dart';
import 'package:rarovideowall/src/modules/home/features/home/model/play_list_content.dart';
import 'package:rarovideowall/src/shared/constants/app_colors.dart';
import 'package:rarovideowall/src/shared/constants/app_text_styles.dart';
import 'package:rarovideowall/src/shared/models/failure.dart';
import 'package:rarovideowall/src/w_system/atoms/buttons/w_text_button.dart';
import 'package:rarovideowall/src/w_system/molecules/w_error_card.dart';
import 'package:rarovideowall/src/w_system/organisms/w_favorite_video_list.dart';
import 'package:rarovideowall/src/w_system/organisms/w_title_video_list.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key, required this.initialState}) : super(key: key);

  final Either<Failure, HomeState> initialState;

  final HomeController homeController = Modular.get();

  @override
  Widget build(BuildContext context) {
    homeController.setHomeState(initialState);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Raro Video Wall',
          style: TextStyles.purple30w700Urbanist,
        ),
        shadowColor: AppColors.purple,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Center(
              child: Observer(builder: (_) {
                return WTextButton(
                  text: homeController.isLogged ? 'Logout' : 'Login',
                  style: TextStyles.black16w700Urbanist,
                  onTap: homeController.isLogged
                      ? homeController.logoutAction
                      : homeController.loginNavigate,
                );
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: homeController.refreshVideos,
              icon: const Icon(Icons.refresh_rounded),
              color: AppColors.black,
            ),
          ),
        ],
        backgroundColor: AppColors.backGroundPageColor,
      ),
      body: Observer(
        name: 'Home State',
        builder: (_) {
          switch (homeController.homeState) {
            case HomeState.success:
              List<WTitleVideoList> playListWidget = _createPlayListWidgets();
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: playListWidget.length,
                  itemBuilder: (_, index) => playListWidget[index],
                ),
              );
            case HomeState.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case HomeState.fail:
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: WErrorCard(
                  action: homeController.refreshVideos,
                  buttonText: 'Quer Tentar novamente?',
                  errorText: homeController.errorText,
                ),
              );
          }
        },
      ),
    );
  }

  List<WTitleVideoList> _createPlayListWidgets() {
    List<WTitleVideoList> playListWidget = [];
    if (homeController.isLogged) {
      List<PlayListContent> playList = homeController.createPlayList();
      playListWidget.add(WFavoriteVideoList(
        onTap: homeController.detailsNavigate,
        videos: homeController.favoriteVideos,
      ));
      playListWidget.addAll(
        List.generate(
          playList.length,
          (index) => WTitleVideoList(
            onTap: homeController.detailsNavigate,
            title: playList[index].name,
            videos: playList[index].videos,
          ),
        ),
      );
    } else {
      playListWidget.add(WTitleVideoList(
        onTap: homeController.detailsNavigate,
        title: 'Públicos',
        videos: homeController.videos,
      ));
    }
    return playListWidget;
  }
}
