import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:rarovideowall/src/shared/models/data_sources/video_model.dart';
import 'package:rarovideowall/src/shared/models/failure.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.initialData}) : super(key: key);

  final Either<Failure, List<VideoModel>> initialData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(child: Text(initialData.toString())));
  }
}
