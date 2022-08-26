import 'package:flutter/material.dart';
import 'package:rarovideowall/src/w_system/organisms/m_splash_screen.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MSplashScreen(),
    );
  }
}
