import 'package:flutter/material.dart';
import 'package:rarovideowall/src/shared/constants/app_colors.dart';

class WCheckBoxButton extends StatefulWidget {
  const WCheckBoxButton(
      {Key? key,
      required this.checkColor,
      required this.value,
      required this.onChanged,
      this.activeColor})
      : super(key: key);

  final Color checkColor;
  final Color? activeColor;
  final bool value;
  final Function(bool?) onChanged;

  @override
  State<WCheckBoxButton> createState() => _WCheckBoxButtonState();
}

class _WCheckBoxButtonState extends State<WCheckBoxButton> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      fillColor: MaterialStateProperty.resolveWith<Color>((states) {
        if (states.contains(MaterialState.selected)) {
          return widget.activeColor!;
        }
        return AppColors.darkGrey;
      }),
      checkColor: widget.checkColor,
      value: widget.value,
      onChanged: widget.onChanged,
    );
  }
}
