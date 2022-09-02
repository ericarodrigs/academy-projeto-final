import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rarovideowall/src/shared/interfaces/videos_repository_interface.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({
    Key? key,
    required this.videoId,
  }) : super(key: key);

  final String videoId;
  IVideosRepository videosRepository = Modular.get();

  get() async {
    var resp =
        (await videosRepository.toggleFavorite(videoId, isFavorite: true));
    print(resp);
  }

  @override
  Widget build(BuildContext context) {
    get();
    return Scaffold(
      body: Center(
        child: Text(videoId),
      ),
    );
  }
}
