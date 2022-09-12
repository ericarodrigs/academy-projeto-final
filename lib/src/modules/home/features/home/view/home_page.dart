import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:rarovideowall/src/modules/home/features/home/controller/home_controller.dart';
import 'package:rarovideowall/src/modules/home/features/home/model/play_list_content_model.dart';
import 'package:rarovideowall/src/shared/constants/app_colors.dart';
import 'package:rarovideowall/src/shared/constants/app_text_styles.dart';
import 'package:rarovideowall/src/shared/constants/load_states.dart';
import 'package:rarovideowall/src/shared/models/failure.dart';
import 'package:rarovideowall/src/w_system/atoms/widgets/w_about_app.dart';
import 'package:rarovideowall/src/w_system/atoms/widgets/w_divider.dart';
import 'package:rarovideowall/src/w_system/atoms/widgets/w_refresh_indicator.dart';
import 'package:rarovideowall/src/w_system/molecules/w_drawer_header.dart';
import 'package:rarovideowall/src/w_system/molecules/w_error_card.dart';
import 'package:rarovideowall/src/w_system/molecules/w_playlist_options.dart';
import 'package:rarovideowall/src/w_system/molecules/w_user_account_actions.dart';
import 'package:rarovideowall/src/w_system/organisms/w_favorite_video_list.dart';
import 'package:rarovideowall/src/w_system/organisms/w_skeleton_home_page.dart';
import 'package:rarovideowall/src/w_system/organisms/w_title_video_list.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key, required this.initialState}) : super(key: key);

  final Either<Failure, LoadState> initialState;

  final HomeController homeController = Modular.get();

  @override
  Widget build(BuildContext context) {
    homeController.setHomeState(initialState);
    return TooltipVisibility(
      visible: false,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Raro Video Wall',
            style: TextStyles.white30w700Urbanist,
          ),
          shadowColor: AppColors.purple,
          backgroundColor: AppColors.purpleTitle,
        ),
        drawer: Observer(
            name: 'Drawer',
            builder: (context) {
              return Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    WDrawerHeader(
                      user: homeController.user,
                      onLoadError: (_, __) =>
                          homeController.onLoadImgError(context),
                      hasError: homeController.hasImgAvatarError,
                    ),
                    WPlayListOptions(
                      isLogged: homeController.isLogged,
                      onAllVideos: () {
                        homeController.setPlaylistOption(Playlist.all);
                        Scaffold.of(context).closeDrawer();
                      },
                      onHistoryVideos: () {
                        homeController.setPlaylistOption(Playlist.historic);
                        Scaffold.of(context).closeDrawer();
                      },
                      onFavoriteVideos: () {
                        homeController.setPlaylistOption(Playlist.favorites);
                        Scaffold.of(context).closeDrawer();
                      },
                      onPublicVideos: () {
                        homeController.setPlaylistOption(Playlist.public);
                        Scaffold.of(context).closeDrawer();
                      },
                      onClassVideos: () {
                        homeController.setPlaylistOption(Playlist.classVideos);
                        Scaffold.of(context).closeDrawer();
                      },
                      onWeekVideos: () {
                        homeController.setPlaylistOption(Playlist.weeks);
                        Scaffold.of(context).closeDrawer();
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: WDivider(),
                    ),
                    WUserAccountActions(
                      isLogged: homeController.isLogged,
                      onRegister: () {
                        Scaffold.of(context).closeDrawer();
                        homeController.registerNavigate();
                      },
                      onLogin: () {
                        Scaffold.of(context).closeDrawer();
                        homeController.loginNavigate();
                      },
                      onLogout: () {
                        Scaffold.of(context).closeDrawer();
                        homeController.logoutAction();
                      },
                    ),
                    const WAboutApp(),
                  ],
                ),
              );
            }),
        body: Observer(
          name: 'Home State',
          builder: (_) {
            switch (homeController.homeState) {
              case LoadState.success:
                List<WTitleVideoList> playListWidget = _createPlayListWidgets();
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: WRefreshIndicator(
                    onRefresh: homeController.refreshVideos,
                    child: ListView.builder(
                      itemCount: playListWidget.length,
                      itemBuilder: (_, index) => playListWidget[index],
                      physics: const AlwaysScrollableScrollPhysics(),
                    ),
                  ),
                );
              case LoadState.loading:
                return const WSkeletonHomePage();
              case LoadState.error:
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
      ),
    );
  }

  List<WTitleVideoList> _createPlayListWidgets() {
    List<WTitleVideoList> playListWidget = [];
    if (homeController.isLogged) {
      List<PlayListContentModel> playList = homeController.createPlayList();

      if (homeController.playlistOption == Playlist.all ||
          homeController.playlistOption == Playlist.favorites) {
        playListWidget.add(WFavoriteVideoList(
          onTap: homeController.detailsNavigate,
          videos: homeController.favoriteVideos,
        ));
      }

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
      playListWidget.add(
        WTitleVideoList(
          onTap: homeController.detailsNavigate,
          title: 'Públicos',
          videos: homeController.videos,
        ),
      );
    }
    return playListWidget;
  }
}
