import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rarovideowall/src/modules/home/features/details/controller/video_details_controller.dart';
import 'package:rarovideowall/src/shared/constants/app_text_styles.dart';
import 'package:rarovideowall/src/w_system/atoms/progress_indicators/w_circular_progress_indicator.dart';
import 'package:rarovideowall/src/w_system/molecules/w_carousel_slider.dart';
import 'package:rarovideowall/src/w_system/molecules/w_error_reload.dart';

class WRelatedClasses extends StatelessWidget {
  const WRelatedClasses({required this.videoDetailsController, Key? key})
      : super(key: key);
  final VideoDetailsController videoDetailsController;

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
              switch (videoDetailsController.relatedState) {
                case LoadState.loading:
                  return const Center(
                    child: WCircularProgressIndicator(),
                  );
                case LoadState.error:
                  return WErrorReload(
                    errorText: videoDetailsController.relatedError,
                    onPressed: videoDetailsController.getRecommendedVideos,
                  );
                case LoadState.done:
                  return WCarouselSlider(
                    relatedVideos: videoDetailsController.relatedVideos,
                  );
              }
            },
          ),
        ],
      ),
    );
  }
}
