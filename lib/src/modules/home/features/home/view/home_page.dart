import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rarovideowall/src/modules/home/features/home/controller/home_controller.dart';

import 'package:rarovideowall/src/shared/constants/app_colors.dart';
import 'package:rarovideowall/src/shared/constants/app_text_styles.dart';
import 'package:rarovideowall/src/shared/models/failure.dart';
import 'package:rarovideowall/src/w_system/atoms/buttons/w_elevated_button.dart';
import 'package:rarovideowall/src/w_system/atoms/buttons/w_text_button.dart';

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
              return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: homeController.playListWidget.length,
                    itemBuilder: (_, index) =>
                        homeController.playListWidget[index],
                  ));
            case HomeState.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case HomeState.fail:
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.errorColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.cardColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('assets/images/errorIcon.png'),
                        Text(
                          homeController.errorText,
                          style: TextStyles.errorRed,
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32.0),
                          child: WElevatedButton(
                            text: 'Quer tentar novamente?',
                            function: homeController.refreshVideos,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
          }
        },
      ),
    );
  }
}
