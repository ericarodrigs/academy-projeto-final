import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rarovideowall/src/modules/home/features/details/controller/video_details_controller.dart';
import '../../../../../w_system/organisms/w_class_video.dart';
import '../../../../../w_system/organisms/w_related_classes.dart';

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
    videoDetailsController.videoId = widget.videoId;
    videoDetailsController.getVideo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WClassVideo(),
                const SizedBox(height: 32),
                WRelatedClasses(),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
