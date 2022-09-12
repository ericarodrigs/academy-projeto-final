import 'package:flutter/material.dart';
import 'package:rarovideowall/src/shared/constants/app_colors.dart';
import 'package:rarovideowall/src/shared/constants/app_text_styles.dart';
import 'package:rarovideowall/src/shared/models/video_model.dart';
import 'package:rarovideowall/src/w_system/atoms/texts/w_date_card_text.dart';
import 'package:rarovideowall/src/w_system/atoms/texts/w_duration_text.dart';

class WVideoCard extends StatelessWidget {
  const WVideoCard({
    Key? key,
    required this.video,
    this.onTap,
    this.onLongPress,
  }) : super(key: key);

  final VideoModel video;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        height: 110,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.purple, width: 1),
          borderRadius: BorderRadius.circular(8),
          color: AppColors.cardColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      video.name,
                      style: TextStyles.black16w700Urbanist,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  WDateCardText(date: video.publicationDate)
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                child: Text(
                  video.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.black14w400Urbanist,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                    child: WDurationText(
                      duration: video.duration,
                    ),
                  ),
                  const Text(
                    'Ver mais ...',
                    style: TextStyles.black14BoldUrbanist,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
