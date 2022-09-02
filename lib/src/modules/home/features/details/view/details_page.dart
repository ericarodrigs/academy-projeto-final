import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    Key? key,
    required this.videoId,
  }) : super(key: key);

  final String videoId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(videoId),
      ),
    );
  }
}
