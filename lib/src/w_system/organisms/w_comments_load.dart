import 'package:flutter/material.dart';

import 'package:rarovideowall/src/w_system/molecules/w_comment_progress_indicator.dart';

class WCommentsLoad extends StatelessWidget {
  const WCommentsLoad({
    Key? key,
    this.height = 170,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (_, index) => WCommentProgressIndicator(
          isRight: index % 2 != 0,
        ),
      ),
    );
  }
}
