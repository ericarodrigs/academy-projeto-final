import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:rarovideowall/src/shared/models/data_models/video_model.dart';
=======
>>>>>>> d53ea14519ae279dda4890a3cce7b970e2740a1e
import 'package:rarovideowall/src/shared/models/failure.dart';

import '../../../../../shared/models/data_models/video_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.initialData}) : super(key: key);

  final Either<Failure, List<VideoModel>> initialData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(child: ));
  }
}
