import 'package:flutter/material.dart';
import 'package:rarovideowall/src/shared/constants/app_colors.dart';
import 'package:rarovideowall/src/shared/constants/app_text_styles.dart';
import 'package:rarovideowall/src/w_system/atoms/buttons/w_elevated_button.dart';

class ShowPopups {
  static void showSnackBar(BuildContext context, String text, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: TextStyles.white14BoldUrbanist,
        ),
        duration: const Duration(seconds: 5),
        backgroundColor: color,
      ),
    );
  }

  static void showDeleteAlertDialog(
    BuildContext context,
    VoidCallback onYes,
    VoidCallback onNo, {
    String title = 'Deletar',
    String content = 'Tem certeza que quer deletar?',
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          backgroundColor: AppColors.backGroundPageColor,
          actions: [
            WElevatedButton(
              text: 'Sim',
              function: onYes,
            ),
            WElevatedButton(
              text: 'Não',
              function: onNo,
            ),
          ],
        );
      },
    );
  }
}
