import 'package:flutter/material.dart';
import 'package:rarovideowall/src/shared/constants/app_colors.dart';
import 'package:rarovideowall/src/shared/constants/app_text_styles.dart';
import 'package:rarovideowall/src/shared/models/video_model.dart';

class WvideoRelatedSlider extends StatelessWidget {
  const WvideoRelatedSlider({required this.video, this.onTap, Key? key}) : super(key: key);
  final VideoModel video;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        width: MediaQuery.of(context).size.width / 1.5,
        height: MediaQuery.of(context).size.height / 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: Image.network(video.thumbUrl, fit: BoxFit.cover)),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(gradient: AppColors.greyGradient),
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
              child: Text(video.nome, style: TextStyles.white10Urbanist),
            )
          ],
        ),
      ),
    );
  }
}
