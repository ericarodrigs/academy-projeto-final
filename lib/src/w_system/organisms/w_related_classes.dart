import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:rarovideowall/src/modules/home/features/details/controller/video_details_controller.dart';
import 'package:rarovideowall/src/shared/constants/app_text_styles.dart';
import 'package:rarovideowall/src/w_system/molecules/w_carousel_slider.dart';
import 'package:rarovideowall/src/w_system/molecules/w_errorText_reloadButton.dart';

class WRelatedClasses extends StatelessWidget {
  const WRelatedClasses({required this.videoDetailsController,Key? key}) : super(key: key);
  final VideoDetailsController videoDetailsController;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Aulas Relacionadas', style: TextStyles.black26w700Urbanist),
          const SizedBox(height: 16),
          Visibility(
              visible: videoDetailsController.relatedState == LoadState.loading,
              child: const Align(alignment: Alignment.center, child: CircularProgressIndicator())),
          Visibility(
            visible: videoDetailsController.relatedState == LoadState.error,
            child: WErrorReload(
                errorText: videoDetailsController.relatedError,
                onPressed: () {
                  videoDetailsController.getRelatedVideos();
                }),
          ),
          Visibility(
            visible: videoDetailsController.relatedState == LoadState.done,
            child: WCarouselSlider(relatedVideos: videoDetailsController.relatedVideos),
          ),
        ],
      ),
    );
  }
}
