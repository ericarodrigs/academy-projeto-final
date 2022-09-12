import 'package:flutter/material.dart';
import 'package:rarovideowall/src/shared/constants/app_colors.dart';

class WCheckBoxButton extends StatelessWidget {
  const WCheckBoxButton({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final bool value;
  final Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      fillColor: MaterialStateProperty.resolveWith<Color>((states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.deepPurple;
        }
        return AppColors.darkGrey;
      }),
      checkColor: AppColors.lightPurple,
      value: value,
      onChanged: onChanged,
    );
  }
}
