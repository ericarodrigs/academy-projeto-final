import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rarovideowall/src/modules/home/features/details/controller/video_controller/video_controller.dart';
import 'package:rarovideowall/src/shared/constants/app_text_styles.dart';
import 'package:rarovideowall/src/shared/constants/load_states.dart';
import 'package:rarovideowall/src/w_system/atoms/progress_indicators/w_circular_progress_indicator.dart';
import 'package:rarovideowall/src/w_system/molecules/w_carousel_slider.dart';
import 'package:rarovideowall/src/w_system/molecules/w_error_reload.dart';

class WRecommendedClasses extends StatelessWidget {
  const WRecommendedClasses({required this.videoController, Key? key})
      : super(key: key);
  final VideoController videoController;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Aulas Relacionadas',
            style: TextStyles.black26w700Urbanist,
          ),
          const SizedBox(height: 16),
          Observer(
            builder: (_) {
              switch (videoController.recommendedState) {
                case LoadState.loading:
                  return const Center(
                    child: WCircularProgressIndicator(),
                  );
                case LoadState.error:
                  return WErrorReload(
                    errorText: videoController.recommendedError,
                    onPressed: videoController.getRecommendedVideos,
                  );
                case LoadState.success:
                  return WCarouselSlider(
                    relatedVideos: videoController.relatedVideos,
                  );
              }
            },
          ),
        ],
      ),
    );
  }
}
