import 'package:flutter_modular/flutter_modular.dart';
import 'package:rarovideowall/src/modules/home/features/details/model/comment_repository.dart';
import 'package:rarovideowall/src/modules/home/features/details/view/details_page.dart';
import 'package:rarovideowall/src/modules/home/features/home/controller/home_controller.dart';
import 'package:rarovideowall/src/modules/home/features/home/view/home_page.dart';
import 'package:rarovideowall/src/modules/home/home_route_names.dart';
import 'package:rarovideowall/src/modules/home/interfaces/comment_repository_interface.dart';

import 'features/details/controller/video_details_controller.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<HomeController>(
      (i) => HomeController(
        videosState: i(),
        loggedState: i(),
        videosRepository: i(),
        loginRepository: i(),
      ),
    ),
    Bind<ICommentRepository>(
      (i) => CommentRepository(
        service: i(),
        loggedState: i(),
      ),
    ),
    Bind.singleton(
      (i) => VideoDetailsController(
        videosRepository: i(),
        commentRepository: i(),
        loggedState: i(),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => HomePage(
        initialState: args.data,
      ),
    ),
    ChildRoute(
      '/${HomeRouteNames.details(':videoId')}',
      child: (_, args) => DetailsPage(
        videoId: args.params['videoId'],
      ),
    ),
  ];
}
