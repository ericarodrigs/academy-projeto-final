import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:rarovideowall/src/modules/home/features/details/controller/details_controller.dart';
import 'package:rarovideowall/src/w_system/molecules/w_app_bar.dart';
import 'package:rarovideowall/src/w_system/organisms/w_class_video.dart';
import 'package:rarovideowall/src/w_system/organisms/w_comment.dart';
import 'package:rarovideowall/src/w_system/organisms/w_recommended_classes.dart';

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
  final detailsController = Modular.get<DetailsController>();

  @override
  void initState() {
    detailsController.initState(widget.videoId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: WAppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: InkWell(
                onTap: () => detailsController.showInfoCard(context),
                child: const Icon(Icons.info_outline),
              ),
            )
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WClassVideo(
                    videoController: detailsController.videoController,
                  ),
                  const SizedBox(height: 12),
                  WComment(
                    commentController: detailsController.commentsController,
                  ),
                  const SizedBox(height: 12),
                  WRecommendedClasses(
                    videoController: detailsController.videoController,
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
