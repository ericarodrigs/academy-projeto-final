import 'package:flutter/material.dart';

import 'package:rarovideowall/src/w_system/molecules/w_empty_favorite_instruction.dart';
import 'package:rarovideowall/src/w_system/organisms/w_title_video_list.dart';

class WFavoriteVideoList extends WTitleVideoList {
  const WFavoriteVideoList({
    Key? key,
    required super.videos,
    required super.onTap,
    super.title = 'Favoritos',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WTitleVideoList(
          videos: videos,
          title: title,
          onTap: onTap,
          showEmptyCard: false,
        ),
        Visibility(
          visible: videos.isEmpty,
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: WEmptyFavoriteInstruction(),
          ),
        ),
      ],
    );
  }
}
