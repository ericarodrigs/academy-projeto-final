import 'package:flutter/material.dart';

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
      checkColor: widget.checkColor,
      activeColor: widget.activeColor,
      value: widget.value,
      onChanged: widget.onChanged,
    );
  }
}
