import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rarovideowall/src/modules/home/features/details/controller/video_details_controller.dart';
import '../../../../../shared/constants/app_text_styles.dart';
import '../../../../../w_system/atoms/texts/w_title_and_text.dart';
import '../../../../../w_system/molecules/w_related_video_card.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({
    Key? key,
    required this.videoId,
  }) : super(key: key);

  final String videoId;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
   final videoDetailsController = Modular.get<VideoDetailsController>();

  @override
  void initState() {
    videoDetailsController.videoId = widget.videoId;
    videoDetailsController.getVideo();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Observer(
          builder: (_) => SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Text(videoDetailsController.video.nome, style: TextStyles.black26w700Urbanist),
                  const SizedBox(height: 16),
                  // videoDetailsController.loadState == LoadState.loading
                  //     ? const Align(alignment: Alignment.center, child: CircularProgressIndicator())
                  //     : AspectRatio(
                  //         aspectRatio: 16 / 9, child: VideoPlayer(videoDetailsController.videoPlayercontroller!)),
                  const SizedBox(height: 32),
                  TitleAndText(title: 'Descrição', text: videoDetailsController.video.descricao),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Videos Relacionados', style: TextStyles.black26w700Urbanist),
                      const SizedBox(height: 16),
                      Visibility(
                          visible: videoDetailsController.relatedState == LoadState.loading,
                          child: const Align(alignment: Alignment.center, child: CircularProgressIndicator())),
                      Visibility(
                          visible: videoDetailsController.relatedState == LoadState.error,
                          child: Column(
                            children: [
                              Text(videoDetailsController.relatedError, style: TextStyles.errorRed),
                              ElevatedButton(
                                  onPressed: () {
                                    videoDetailsController.getRelatedVideos();
                                  },
                                  child: const Text('Recarregar'))
                            ],
                          )),
                      Visibility(
                        visible: videoDetailsController.relatedState == LoadState.done,
                        child: CarouselSlider.builder(
                          itemCount: videoDetailsController.relatedVideos.length,
                          itemBuilder: (BuildContext context, int i, int pageViewIndex) => WvideoRelatedSlider(
                            video: videoDetailsController.relatedVideos[i],
                            onTap: () {
                              Modular.to
                                  .popAndPushNamed('details/${videoDetailsController.relatedVideos[i].id}');
                            },
                          ),
                          options: CarouselOptions(
                            aspectRatio: 2.0,
                            enableInfiniteScroll: false,
                            enlargeCenterPage: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
