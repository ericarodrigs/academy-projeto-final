import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:rarovideowall/src/shared/constants/app_colors.dart';
import 'package:rarovideowall/src/shared/constants/app_text_styles.dart';
import 'package:rarovideowall/src/w_system/atoms/buttons/w_text_button.dart';

class WLoginActionsList {
  final bool isLoggedObserver;
  final VoidCallback loginAction;
  final VoidCallback refreshAction;

  WLoginActionsList({
    required this.isLoggedObserver,
    required this.loginAction,
    required this.refreshAction,
  }) : actions = [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Center(
              child: Observer(
                  name: 'LoginObserver',
                  builder: (_) {
                    return WTextButton(
                      text: isLoggedObserver ? 'Logout' : 'Login',
                      style: TextStyles.black16w700Urbanist,
                      onTap: loginAction,
                    );
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: refreshAction,
              icon: const Icon(Icons.refresh_rounded),
              color: AppColors.black,
            ),
          ),
        ];

  List<Widget> actions;
}
