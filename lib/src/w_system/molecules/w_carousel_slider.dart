import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rarovideowall/src/shared/models/video_model.dart';
import 'package:rarovideowall/src/w_system/molecules/w_related_video_card.dart';

class WCarouselSlider extends StatelessWidget {
  const WCarouselSlider({required this.relatedVideos, Key? key})
      : super(key: key);
  final List<VideoModel> relatedVideos;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: relatedVideos.length,
      itemBuilder: (BuildContext context, int i, int pageViewIndex) =>
          WVideoRelatedSlider(
        video: relatedVideos[i],
        onTap: () {
          Modular.to.popAndPushNamed('details/${relatedVideos[i].id}');
        },
      ),
      options: CarouselOptions(
        aspectRatio: 2.0,
        enableInfiniteScroll: false,
        enlargeCenterPage: true,
      ),
    );
  }
}
