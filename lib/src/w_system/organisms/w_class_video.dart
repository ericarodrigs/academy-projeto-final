import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../modules/home/features/details/controller/video_details_controller.dart';
import '../../shared/constants/app_text_styles.dart';
import '../atoms/texts/w_title_and_text.dart';
import '../molecules/w_errorText_reloadButton.dart';
import '../molecules/w_inapp_webview.dart';

class WClassVideo extends StatelessWidget {
  WClassVideo({Key? key}) : super(key: key);
  final videoDetailsController = Modular.get<VideoDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(videoDetailsController.video.nome, style: TextStyles.black26w700Urbanist),
        const SizedBox(height: 16),
        Visibility(
            visible: videoDetailsController.videoLoadState == LoadState.loading,
            child: const Align(alignment: Alignment.center, child: CircularProgressIndicator())),
        Visibility(
          visible: videoDetailsController.videoLoadState == LoadState.error,
          child: WErrorReload(
              errorText: videoDetailsController.videoError,
              onPressed: () {
                videoDetailsController.getVideo();
              }),
        ),
        Visibility(
          visible: videoDetailsController.videoLoadState == LoadState.done,
          child: SizedBox(
            height: MediaQuery.of(context).size.width / 1.5,
            width: MediaQuery.of(context).size.width,
            child: WInappWebView(url: videoDetailsController.video.url),
          ),
        ),
        const SizedBox(height: 16),
        TitleAndText(title: 'Descrição', text: videoDetailsController.video.descricao),
      ]),
    );
  }
}
