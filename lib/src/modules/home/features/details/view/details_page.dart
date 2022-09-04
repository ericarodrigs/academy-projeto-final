import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rarovideowall/src/modules/home/features/details/model/comment_repository.dart';
import 'package:rarovideowall/src/shared/interfaces/videos_repository_interface.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({
    Key? key,
    required this.videoId,
  }) : super(key: key);

  final String videoId;
  CommentRepository commentRepository = Modular.get();

  get() async {
    print(await commentRepository.voteComment(
      videoId,
      '3e93f2c6-03d0-4690-a3fd-eac2fa3ec0ba',
      isUpVote: true,
      resetVote: true,
    ));
    var resp = (await commentRepository.getComments(videoId));
    resp.fold(
        (l) => null, (r) => print('${r.last.upVotes}, ${r.last.downVotes}'));
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
