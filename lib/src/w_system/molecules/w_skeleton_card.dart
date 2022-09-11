import 'package:flutter/material.dart';
import 'package:rarovideowall/src/shared/constants/app_colors.dart';
import 'package:rarovideowall/src/w_system/atoms/widgets/w_skeleton.dart';

class WSkeletonCard extends StatelessWidget {
  const WSkeletonCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 110,
        decoration: BoxDecoration(
          border:
          Border.all(color: AppColors.purple.withOpacity(0.3), width: 1),
          borderRadius: BorderRadius.circular(8),
          color: AppColors.cardColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Expanded(
                      child: WSkeleton(
                        height: 18,
                      )),
                  SizedBox(
                    width: 8,
                  ),
                  WSkeleton(
                    width: 100,
                    height: 18,
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              const WSkeleton(
                height: 36,
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  WSkeleton(
                    width: 100,
                    height: 18,
                  ),
                  WSkeleton(
                    width: 100,
                    height: 18,
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
