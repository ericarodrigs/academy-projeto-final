import 'package:flutter/material.dart';
import 'package:rarovideowall/src/shared/constants/app_colors.dart';
import 'package:rarovideowall/src/shared/constants/app_text_styles.dart';
import 'package:rarovideowall/src/w_system/atoms/buttons/w_elevated_button.dart';

class WErrorCard extends StatelessWidget {
  const WErrorCard({
    Key? key,
    required this.buttonText,
    required this.errorText,
    required this.action,
  }) : super(key: key);

  final String buttonText;
  final String errorText;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.errorColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
          color: AppColors.cardColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/images/errorIcon.png'),
            Text(
              errorText,
              style: TextStyles.errorRed,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: WElevatedButton(
                text: buttonText,
                function: action,
              ),
            )
          ],
        ),
      ),
    );
  }
}
