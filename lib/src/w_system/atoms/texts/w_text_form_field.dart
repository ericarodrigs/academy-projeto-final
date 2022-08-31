import 'package:flutter/material.dart';
import 'package:rarovideowall/src/shared/constants/app_colors.dart';

class WTextFormFIeld extends StatelessWidget {
  const WTextFormFIeld(
      {required this.text,
      this.errorText,
      this.validator,
      this.controller,
      this.isEnabled = true,
      Key? key})
      : super(key: key);
  final String text;
  final String? errorText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool isEnabled;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isEnabled,
      style: const TextStyle(color: Colors.black),
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
          labelText: text,
          errorText: errorText,
          filled: !isEnabled,
          labelStyle: const TextStyle(color: Colors.black),
          enabledBorder: _customOutlineInputBorder(AppColors.lightGrey),
          disabledBorder: _customOutlineInputBorder(AppColors.lightGrey),
          focusedBorder: _customOutlineInputBorder(AppColors.darkGrey),
          errorBorder: _customOutlineInputBorder(Colors.red),
          focusedErrorBorder: _customOutlineInputBorder(Colors.red),
          errorStyle: const TextStyle(color: Colors.red)),
    );
  }
}

InputBorder? _customOutlineInputBorder(Color borderColor) {
  return OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: borderColor),
      borderRadius: BorderRadius.circular(10));
}
