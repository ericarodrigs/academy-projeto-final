import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rarovideowall/src/modules/splash_module/feature/splash_screen/controller/splash_controller.dart';
import 'package:rarovideowall/src/w_system/organisms/w_splash_screen.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  SplashController splashController = Modular.get();

  @override
  void initState() {
    super.initState();
    splashController.tryLocalStorageLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WSplashScreen(
        onFinishAnimation: () {
          splashController.animationIsFinished = true;
          splashController.tryNavigate();
        },
      ),
    );
  }
}
