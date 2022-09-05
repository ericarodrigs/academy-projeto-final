import 'package:flutter/material.dart';
import 'package:rarovideowall/src/shared/constants/app_colors.dart';

class WTextFormField extends StatelessWidget {
  final String? text;
  final String? hintText;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final String? errorText;
  final String? Function(String?)? validator;
  final VoidCallback? togglePasswordView;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final bool obscureText;
  final int? maxLines;
  final int? minLines;
  final bool isEnabled;
  final EdgeInsets? contentPadding;

  const WTextFormField({
    this.text,
    this.hintText,
    this.floatingLabelBehavior,
    this.errorText,
    this.validator,
    this.controller,
    this.textInputAction,
    this.keyboardType,
    this.obscureText = false,
    this.togglePasswordView,
    this.minLines,
    this.maxLines,
    this.isEnabled = true,
    this.contentPadding,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isEnabled,
      style: const TextStyle(color: Colors.black),
      validator: validator,
      controller: controller,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      obscureText: obscureText,
      minLines: minLines,
      maxLines: obscureText ? 1 : maxLines,
      decoration: InputDecoration(
        labelText: text,
        hintText: hintText,
        floatingLabelBehavior: floatingLabelBehavior,
        contentPadding: contentPadding,
        errorText: errorText,
        errorMaxLines: 5,
        filled: !isEnabled,
        labelStyle: const TextStyle(color: Colors.black),
        enabledBorder: customOutlineInputBorder(AppColors.lightGrey),
        disabledBorder: customOutlineInputBorder(AppColors.lightGrey),
        focusedBorder: customOutlineInputBorder(AppColors.darkGrey),
        errorBorder: customOutlineInputBorder(Colors.red),
        focusedErrorBorder: customOutlineInputBorder(Colors.red),
        errorStyle: const TextStyle(color: Colors.red),
        suffixIcon: togglePasswordView != null
            ? IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: togglePasswordView,
              )
            : null,
      ),
    );
  }
}

class WTextButton extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Function()? onTap;
  final bool isEnabled;

  const WTextButton(
      {required this.text,
        this.style,
        this.onTap,
        this.isEnabled = true,
        Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: isEnabled ? onTap : null,
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
