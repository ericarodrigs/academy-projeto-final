import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:rarovideowall/src/modules/home/features/home/controller/home_controller.dart';
import 'package:rarovideowall/src/modules/home/features/home/model/play_list_content.dart';
import 'package:rarovideowall/src/shared/constants/app_colors.dart';
import 'package:rarovideowall/src/shared/constants/app_text_styles.dart';
import 'package:rarovideowall/src/shared/constants/load_states.dart';
import 'package:rarovideowall/src/shared/models/failure.dart';
import 'package:rarovideowall/src/w_system/atoms/widgets/w_about_app.dart';
import 'package:rarovideowall/src/w_system/atoms/widgets/w_divider.dart';
import 'package:rarovideowall/src/w_system/molecules/w_drawer_header.dart';
import 'package:rarovideowall/src/w_system/molecules/w_error_card.dart';
import 'package:rarovideowall/src/w_system/molecules/w_playlist_options.dart';
import 'package:rarovideowall/src/w_system/molecules/w_user_account_actions.dart';
import 'package:rarovideowall/src/w_system/organisms/w_favorite_video_list.dart';
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
                  child: RefreshIndicator(
                    color: Colors.white,
                    backgroundColor: AppColors.purpleTitle,
                    onRefresh: homeController.refreshVideos,
                    child: ListView.builder(
                      itemCount: playListWidget.length,
                      itemBuilder: (_, index) => playListWidget[index],
                      physics: const AlwaysScrollableScrollPhysics(),
                    ),
                  ),
                );
              case LoadState.loading:
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 16,
                        top: 16.0,
                        right: 16,
                      ),
                      child: Skeleton(
                        height: 25,
                        width: 220,
                      ),
                    ),
                    Flexible(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (_, __) => const NewSkeletonVideo(),
                        itemCount: 5,
                      ),
                    )
                  ],
                );
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
      List<PlayListContent> playList = homeController.createPlayList();

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

class NewSkeletonVideo extends StatelessWidget {
  const NewSkeletonVideo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          border:
              Border.all(color: AppColors.purple.withOpacity(0.3), width: 1),
          borderRadius: BorderRadius.circular(8),
          color: AppColors.cardColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Expanded(
                      child: Skeleton(
                    height: 20,
                  )),
                  SizedBox(
                    width: 8,
                  ),
                  Skeleton(
                    width: 100,
                    height: 20,
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              const Skeleton(
                height: 40,
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Skeleton(
                    width: 100,
                    height: 20,
                  ),
                  Skeleton(
                    width: 100,
                    height: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Skeleton extends StatelessWidget {
  const Skeleton({
    Key? key,
    this.width,
    required this.height,
  }) : super(key: key);
  final double? width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.06),
          borderRadius: const BorderRadius.all(Radius.circular(16))),
    );
  }
}
