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
import 'package:rarovideowall/src/w_system/atoms/progress_indicators/w_circular_progress_indicator.dart';
import 'package:rarovideowall/src/w_system/molecules/w_error_card.dart';
import 'package:rarovideowall/src/w_system/organisms/w_favorite_video_list.dart';
import 'package:rarovideowall/src/w_system/organisms/w_title_video_list.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key, required this.initialState}) : super(key: key);

  final Either<Failure, LoadState> initialState;

  final HomeController homeController = Modular.get();
  void Function(Object?, StackTrace?)? onLoadError;
  bool hasError = true;

  @override
  Widget build(BuildContext context) {
    homeController.setHomeState(initialState);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Raro Video Wall',
          style: TextStyles.white30w700Urbanist,
        ),
        shadowColor: AppColors.purple,
        backgroundColor: AppColors.purpleTitle,
      ),
      drawer: Observer(
          name: 'Home State',
          builder: (_) {
            return Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: const BoxDecoration(
                      color: AppColors.purpleTitle,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              foregroundImage: homeController.isLogged
                                  ? NetworkImage(
                                      homeController.loggedState.user!.photo)
                                  : const AssetImage('assets/images/capelo.png')
                                      as ImageProvider,
                              onForegroundImageError: onLoadError,
                              backgroundColor: Colors.transparent,
                              radius: 50,
                              child: hasError
                                  ? const Icon(Icons.warning_amber,
                                      color: Colors.white)
                                  : const WCircularProgressIndicator(),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.sunny,
                                    color: Colors.white))
                          ],
                        ),
                        Text(
                          homeController.isLogged
                              ? homeController.loggedState.user!.name
                              : 'Raro Academy',
                          style: TextStyles.white30w700Urbanist,
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                      leading: const Icon(
                        Icons.home,
                        color: AppColors.purple,
                      ),
                      title: const Text('Home'),
                      onTap: homeController.homeNavigate),
                  homeController.isLogged
                      ? Column(
                          children: [
                            ListTile(
                              leading: const Icon(
                                Icons.favorite,
                                color: AppColors.purple,
                              ),
                              title: const Text('Favoritos'),
                              onTap: homeController.favoriteNavigate,
                            ),
                            ListTile(
                              leading: const Icon(
                                Icons.public,
                                color: AppColors.purple,
                              ),
                              title: const Text('Público'),
                              onTap: homeController.publicNavigate,
                            ),
                            ListTile(
                              leading: const Icon(
                                Icons.class_,
                                color: AppColors.purple,
                              ),
                              title: const Text('Minha Turma'),
                              onTap: homeController.classNavigate,
                            ),
                            ListTile(
                              leading: const Icon(
                                Icons.calendar_month,
                                color: AppColors.purple,
                              ),
                              title: const Text('Semanas'),
                              onTap: homeController.weekNavigate,
                            ),
                            ListTile(
                              leading: const Icon(
                                Icons.refresh,
                                color: AppColors.purple,
                              ),
                              title: const Text('Últimos vistos'),
                              onTap: homeController.historyNavigate,
                            )
                          ],
                        )
                      : ListTile(
                          leading: const Icon(
                            Icons.add_reaction,
                            color: AppColors.purple,
                          ),
                          title: const Text('Cadastrar'),
                          onTap: () {
                            homeController.registerNavigate();
                            Navigator.pop(context);
                          },
                        ),
                  ListTile(
                    leading: homeController.isLogged
                        ? const Icon(
                            Icons.logout,
                            color: AppColors.purple,
                          )
                        : const Icon(
                            Icons.login,
                            color: AppColors.purple,
                          ),
                    title: Text(
                      homeController.isLogged ? 'Logout' : 'Login',
                    ),
                    onTap: () {
                      homeController.isLogged
                          ? homeController.logoutAction()
                          : homeController.loginNavigate();
                      Navigator.pop(context);
                    },
                  ),
                  const AboutListTile(
                    // <-- SEE HERE
                    icon: Icon(
                      Icons.info,
                      color: AppColors.purple,
                    ),
                    applicationIcon: Icon(
                      Icons.local_play,
                    ),
                    applicationName: 'Raro Video Wall',
                    applicationVersion: '1.0.0',
                    applicationLegalese: '© 2022 Raro Academy',
                    aboutBoxChildren: [

                    ],
                    child: Text('Sobre o app'),
                  ),
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
                  ));
            case LoadState.loading:
              return const Center(
                child: WCircularProgressIndicator(),
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
    );
  }

  List<WTitleVideoList> _createPlayListWidgets() {
    List<WTitleVideoList> playListWidget = [];
    if (homeController.isLogged) {
      List<PlayListContent> playList = homeController.createPlayList();
      if (!homeController.onlyVideoTypes) {
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
            title:
                playList[index].videos.isNotEmpty ? playList[index].name : '',
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
