import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rarovideowall/src/modules/home/interfaces/comment_repository_interface.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({
    Key? key,
    required this.videoId,
  }) : super(key: key);

  final String videoId;
  ICommentRepository commentRepository = Modular.get();

  get() async {
    print(await commentRepository.voteComment(
      videoId,
      '3e93f2c6-03d0-4690-a3fd-eac2fa3ec0ba',
      isUpVote: true,
      resetVote: true,
    ));
    var resp = (await commentRepository.getComments(videoId));
    //TODO = Unhandled Exception: Bad state: No element
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
