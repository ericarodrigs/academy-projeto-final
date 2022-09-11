import 'package:flutter/material.dart';
import 'package:rarovideowall/src/w_system/atoms/widgets/w_skeleton.dart';
import 'package:rarovideowall/src/w_system/molecules/w_skeleton_card.dart';

class WSkeletonHomePage extends StatelessWidget {
  const WSkeletonHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(
            left: 16,
            top: 16.0,
            right: 16,
          ),
          child: WSkeleton(
            height: 25,
            width: 220,
          ),
        ),
        Flexible(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (_, __) => const WSkeletonCard(),
            itemCount: 5,
          ),
        )
      ],
    );
  }
}
