import 'package:flutter/material.dart';
import 'package:rarovideowall/src/modules/login_module/view/login_page.dart';
import 'package:rarovideowall/w_system/atoms/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.backGroundPageColor,
      ),
      home: LoginPage() ,
    );
  }
}
