import 'package:flutter/material.dart';

import 'package:rarovideowall/src/shared/constants/app_text_styles.dart';
import 'package:rarovideowall/src/shared/models/video_model.dart';
import 'package:rarovideowall/src/w_system/molecules/w_empty_video_card.dart';
import 'package:rarovideowall/src/w_system/molecules/w_video_card.dart';

class WTitleVideoList extends StatelessWidget {
  const WTitleVideoList({
    Key? key,
    required this.videos,
    required this.title,
    this.scrollPhysics = const NeverScrollableScrollPhysics(),
    required this.onTap,
    this.showEmptyCard = true,
  }) : super(key: key);

  final List<VideoModel> videos;
  final String title;
  final ScrollPhysics scrollPhysics;
  final void Function(VideoModel) onTap;
  final bool showEmptyCard;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyles.black26w700Urbanist,
        ),
        videos.isEmpty
            ? Visibility(
                visible: showEmptyCard,
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: WEmptyVideosCard(),
                ),
              )
            : ListView.builder(
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
