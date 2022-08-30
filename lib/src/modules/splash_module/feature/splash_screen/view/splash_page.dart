import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rarovideowall/src/modules/splash_module/interfaces/splash_controller_interface.dart';
import 'package:rarovideowall/src/w_system/organisms/m_splash_screen.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  ISplashController splashController = Modular.get();

  @override
  void initState() {
    super.initState();
    splashController.tryLocalStorageLogin();
    Timer(
      const Duration(seconds: 3),
          () async =>   {splashController.tryLocalStorageLogin(),
           Modular.to.pushReplacementNamed('/login'),}
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MSplashScreen(),
    );
  }
}
