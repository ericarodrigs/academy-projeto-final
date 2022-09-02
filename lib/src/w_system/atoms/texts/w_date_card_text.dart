import 'package:flutter/material.dart';
import 'package:rarovideowall/src/shared/constants/app_text_styles.dart';

class WDateCardText extends StatelessWidget {
  const WDateCardText({
    Key? key,
    required this.date,
  }) : super(key: key);

  final String date;

  @override
  Widget build(BuildContext context) {
    DateTime utcDate = DateTime.tryParse(date) ?? DateTime(0);
    String day = utcDate.day.toString();
    String month = utcDate.month.toString();
    String year = utcDate.year.toString();
    return Text(
      '${day.padLeft(2, '0')}/${month.padLeft(2, '0')}/${year.padLeft(4, '0')}',
      style: TextStyles.deepPurple16w700Urbanist,
    );
  }
}
