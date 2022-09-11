import 'package:flutter/material.dart';
import 'package:rarovideowall/src/w_system/atoms/progress_indicators/w_circular_progress_indicator.dart';
import 'package:rarovideowall/src/w_system/atoms/progress_indicators/w_linear_progress_indicator.dart';

class WCommentProgressIndicator extends StatelessWidget {
  const WCommentProgressIndicator({
    Key? key,
    required this.isRight,
  }) : super(key: key);

  final bool isRight;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isRight ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment:
              isRight ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: isRight ? _right : _left,
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(24, 10, 24, 15),
          child: SizedBox(
            height: 5,
            width: 150,
            child: WLinearProgressIndicator(),
          ),
        ),
      ],
    );
  }

  final List<Widget> _left = const [
    CircleAvatar(
      radius: 20,
      backgroundColor: Colors.transparent,
      child: WCircularProgressIndicator(),
    ),
    Padding(
      padding: EdgeInsets.only(left: 10.0),
      child: SizedBox(
        height: 5,
        width: 60,
        child: WLinearProgressIndicator(),
      ),
    ),
  ];
  final List<Widget> _right = const [
    Padding(
      padding: EdgeInsets.only(right: 10.0),
      child: SizedBox(
        height: 5,
        width: 60,
        child: WLinearProgressIndicator(),
      ),
    ),
    CircleAvatar(
      radius: 20,
      backgroundColor: Colors.transparent,
      child: WCircularProgressIndicator(),
    ),
  ];
}
