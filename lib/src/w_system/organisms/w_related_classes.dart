import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../modules/home/features/details/controller/video_details_controller.dart';
import '../../shared/constants/app_text_styles.dart';
import '../molecules/w_carousel_slider.dart';
import '../molecules/w_errorText_reloadButton.dart';

class WRelatedClasses extends StatelessWidget {
  WRelatedClasses({Key? key}) : super(key: key);
  final videoDetailsController = Modular.get<VideoDetailsController>();

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
