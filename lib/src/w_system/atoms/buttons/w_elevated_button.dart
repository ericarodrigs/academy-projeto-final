import 'package:flutter/material.dart';
import 'package:rarovideowall/src/shared/constants/app_colors.dart';

class WElevatedButton extends StatelessWidget {
  const WElevatedButton({
    required this.text,
    this.function,
    this.isEnabled = true,
    this.width = double.infinity,
    Key? key,
  }) : super(key: key);
  final String text;
  final VoidCallback? function;
  final bool isEnabled;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnabled ? function : null,
      style: ElevatedButton.styleFrom(
        primary: AppColors.deepPurple,
        minimumSize: Size(width, 20),
        padding: const EdgeInsets.symmetric(vertical: 11),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: const TextStyle(fontSize: 18),
      ),
      child: Text(text),
    );
  }
}
