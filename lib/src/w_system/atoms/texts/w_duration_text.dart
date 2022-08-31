import 'package:flutter/material.dart';
import 'package:rarovideowall/src/shared/constants/app_text_styles.dart';

class WDurationText extends StatelessWidget {
  const WDurationText({
    Key? key,
    required this.duration,
  }) : super(key: key);

  final String duration;

  @override
  Widget build(BuildContext context) {
    List<String> parts = duration.split(RegExp(r'[:hm]'));
    String hours = parts[0];
    String minutes = parts[1];

    return Text(
      'Duração: ${hours.padLeft(2, '0')}:${minutes.padLeft(2, '0')}',
      style: TextStyles.black14BoldUrbanist,
    );
  }
}
