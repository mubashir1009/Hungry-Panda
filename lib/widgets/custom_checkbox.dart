import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?>? onChanged;
  final double borderWidth;
  final Color? borderColor;
  final Color? activeColor;
  final Color? checkColor;
  final OutlinedBorder? shape;
  final double? splashRadius;
  final bool autofocus;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.borderWidth = 1.0,
    this.borderColor,
    this.activeColor,
    this.checkColor,
    this.shape,
    this.splashRadius,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: onChanged,
      activeColor: activeColor,
      checkColor: checkColor,
      splashRadius: splashRadius,
      autofocus: autofocus,
      shape: shape,
      side: BorderSide(
        width: borderWidth,
        color: borderColor ?? Theme.of(context).dividerColor,
      ),
    );
  }
}
