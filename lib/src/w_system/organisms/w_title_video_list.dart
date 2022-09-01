import 'package:flutter/material.dart';

import 'package:rarovideowall/src/shared/constants/app_text_styles.dart';
import 'package:rarovideowall/src/shared/models/video_model.dart';
import 'package:rarovideowall/src/w_system/molecules/w_video_card.dart';

class WTitleVideoList extends StatelessWidget {
  const WTitleVideoList({
    Key? key,
    required this.videos,
    required this.title,
    required this.onTap,
    this.scrollPhysics = const NeverScrollableScrollPhysics(),
  }) : super(key: key);

  final List<VideoModel> videos;
  final String title;
  final ScrollPhysics scrollPhysics;
  final void Function(VideoModel) onTap;

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
              child: WVideoCard(
                video: videos[index],
                onTap: () {
                  onTap(videos[index]);
                },
              ),
            );
          },
        )
      ],
    );
  }
}
