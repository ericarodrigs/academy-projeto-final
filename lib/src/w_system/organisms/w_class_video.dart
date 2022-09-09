import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:rarovideowall/src/modules/home/features/details/controller/video_details_controller.dart';
import 'package:rarovideowall/src/shared/constants/app_text_styles.dart';
import 'package:rarovideowall/src/w_system/atoms/buttons/w_favorite.dart';
import 'package:rarovideowall/src/w_system/atoms/progress_indicators/w_circular_progress_indicator.dart';
import 'package:rarovideowall/src/w_system/atoms/texts/w_title_and_text.dart';
import 'package:rarovideowall/src/w_system/molecules/w_error_reload.dart';
import 'package:rarovideowall/src/w_system/molecules/w_inapp_webview.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class WClassVideo extends StatelessWidget {
  const WClassVideo({
    required this.videoDetailsController,
    Key? key,
  }) : super(key: key);

  final VideoDetailsController videoDetailsController;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(videoDetailsController.video.nome,
              style: TextStyles.black26w700Urbanist),
          const SizedBox(height: 16),
          Observer(
            builder: (_) {
              switch (videoDetailsController.videoLoadState) {
                case LoadState.loading:
                  return const Center(
                    child: WCircularProgressIndicator(),
                  );
                case LoadState.error:
                  return WErrorReload(
                    errorText: videoDetailsController.videoError,
                    onPressed: videoDetailsController.getVideo,
                  );
                case LoadState.done:
                  return videoDetailsController.getIsYoutube()
                      ? YoutubePlayerIFrame(
                          controller:
                              videoDetailsController.youtubePlayerController,
                        )
                      : SizedBox(
                          height: MediaQuery.of(context).size.width / 1.5,
                          width: MediaQuery.of(context).size.width,
                          child: WInappWebView(
                            url: videoDetailsController.video.url,
                          ),
                        );
              }
            },
          ),
          const SizedBox(height: 16),
          Visibility(
            visible: videoDetailsController.loggedState.isLogged,
            child: WFavorite(
              isFavorite: videoDetailsController.isFavorite,
              onPressed: () => videoDetailsController.favoriteVideo(context),
            ),
          ),
          const SizedBox(height: 6),
          TitleAndText(
            title: 'Descrição',
            text: videoDetailsController.video.descricao,
          ),
        ],
      ),
    );
  }
}
