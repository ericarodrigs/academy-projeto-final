import 'package:flutter/material.dart';
import 'package:rarovideowall/src/shared/constants/app_colors.dart';

class WAboutApp extends StatelessWidget {
  const WAboutApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AboutListTile(
      icon: Icon(
        Icons.info,
        color: AppColors.purple,
      ),
      applicationIcon: Icon(
        Icons.local_play,
      ),
      applicationName: 'Raro Video Wall',
      applicationVersion: '1.0.0',
      applicationLegalese: '© 2022 Raro Academy',
      aboutBoxChildren: [],
      child: Text('Sobre o app'),
    );
  }
}
