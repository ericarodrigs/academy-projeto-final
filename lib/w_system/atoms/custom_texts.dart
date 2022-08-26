import 'package:flutter/material.dart';
import 'package:rarovideowall/src/shared/constants/app_colors.dart';

class WTextFormFIeld extends StatelessWidget {
  const WTextFormFIeld({required this.text, this.validator, Key? key})
      : super(key: key);
  final String text;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      validator: validator,
      decoration: InputDecoration(
          labelText: text,
          labelStyle: const TextStyle(color: Colors.black),
          enabledBorder: customOutlineInputBorder(AppColors.lightGrey),
          focusedBorder: customOutlineInputBorder(AppColors.darkGrey),
          errorBorder: customOutlineInputBorder(Colors.red),
          focusedErrorBorder: customOutlineInputBorder(Colors.red),
          errorStyle: const TextStyle(color: Colors.red)),
    );
  }
}

class WTextButton extends StatelessWidget {
  const WTextButton({required this.text, this.style, this.onTap, Key? key})
      : super(key: key);
  final String text;
  final TextStyle? style;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Ink(
            child: Text(
          text,
          style: style,
        )));
  }
}

InputBorder? customOutlineInputBorder(Color borderColor) {
  return OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: borderColor),
      borderRadius: BorderRadius.circular(10));
}
