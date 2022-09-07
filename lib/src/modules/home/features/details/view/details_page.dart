// ignore_for_file: prefer_function_declarations_over_variables

import 'package:dartz/dartz.dart' show Either;
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rarovideowall/src/modules/home/features/details/controller/video_details_controller.dart';
import 'package:rarovideowall/src/shared/constants/app_colors.dart';
import 'package:rarovideowall/src/w_system/organisms/w_class_video.dart';
import 'package:rarovideowall/src/w_system/organisms/w_related_classes.dart';

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
    videoDetailsController.initializePageInfo(widget.videoId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.backGroundPageColor,
        foregroundColor: AppColors.black,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WClassVideo(videoDetailsController: videoDetailsController),
                const SizedBox(height: 32),
                WRelatedClasses(videoDetailsController: videoDetailsController),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
