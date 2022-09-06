import 'package:flutter/material.dart';
import '../../../shared/constants/app_text_styles.dart';

class TitleAndText extends StatelessWidget {
  const TitleAndText({required this.text, this.title, Key? key}) : super(key: key);
  final String? title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [Text(title ?? '', style: TextStyles.black14BoldUrbanist), const SizedBox(height: 6), Text(text)],
    );
  }
}
