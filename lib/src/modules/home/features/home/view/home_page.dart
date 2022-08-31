import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import 'package:rarovideowall/src/shared/constants/app_colors.dart';
import 'package:rarovideowall/src/shared/constants/app_text_styles.dart';
import 'package:rarovideowall/src/shared/models/failure.dart';
import 'package:rarovideowall/src/shared/models/video_model.dart';
import 'package:rarovideowall/src/w_system/atoms/buttons/w_text_button.dart';
import 'package:rarovideowall/src/w_system/molecules/w_video_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.initialData}) : super(key: key);

  final Either<Failure, List<VideoModel>> initialData;

  @override
  Widget build(BuildContext context) {
    List<VideoModel> videos =
        initialData.foldRight(null, (r, previous) => r) ?? [];
    print(videos);
    var teste = videos.where((video) => video.tags.contains('aulão')).toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Raro Video Wall',
          style: TextStyles.purple30w700Urbanist,
        ),
        shadowColor: AppColors.purple,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Center(
              child: WTextButton(
                text: 'Login',
                style: TextStyles.black16w700Urbanist,
              ),
            ),
          )
        ],
        backgroundColor: AppColors.backGroundPageColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (_, index) {
            return WTitleVideoList(videos: teste, title: 'Semana 01');
          },
        ),
      ),
    );
  }
}

class WTitleVideoList extends StatelessWidget {
  const WTitleVideoList({
    Key? key,
    required this.videos,
    required this.title,
    this.scrollPhysics = const NeverScrollableScrollPhysics(),
  }) : super(key: key);

  final List<VideoModel> videos;
  final String title;
  final ScrollPhysics scrollPhysics;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyles.black26w700Urbanist,
        ),
        ListView.builder(
          itemCount: videos.length,
          shrinkWrap: true,
          physics: scrollPhysics,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: WVideoCard(video: videos[index]),
            );
          },
        )
      ],
    );
  }
}
