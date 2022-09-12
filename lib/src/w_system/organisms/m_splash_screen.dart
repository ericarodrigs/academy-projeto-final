import 'package:flutter/material.dart';

import 'package:rarovideowall/src/shared/constants/app_text_styles.dart';
import 'package:rarovideowall/src/w_system/atoms/widgets/w_rotate_capelo.dart';

class MSplashScreen extends StatelessWidget {
  const MSplashScreen({
    Key? key,
    required this.onFinishAnimation,
  }) : super(key: key);

  final VoidCallback onFinishAnimation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    WRotateCapelo(
                      onFinishAnimation: onFinishAnimation,
                    ),
                    const Text(
                      'Raro Video Wall',
                      style: TextStyles.purple30w700Urbanist,
                    ),
                  ],
                ),
              ),
              const Text(
                '@2022 Raro Academy',
                style: TextStyles.deepPurple16w700Urbanist,
              ),
              const SizedBox(
                height: 24,
              )
            ],
          ),
        ],
      ),
    );
  }
}
