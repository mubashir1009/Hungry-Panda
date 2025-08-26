import 'package:flutter/material.dart';
import 'package:riverpodpractice/widgets/custom_animated_container.dart';

class CustomElevatedButton extends StatelessWidget {
  final Widget? child;
  final Color? color;
  final Color? hoverColor;
  final double? height;
  final double? width;
  final double? borderRadius;
  final double? verPadding;
  final double? horPadding;
  final double? borderWidth;
  final Color? borderColor;
  final bool? isShadow;
  final Color? shadowColor;
  final Alignment? alignment;
  final VoidCallback onPressed;
  final ValueChanged<bool>? onFocusChange;
  final Function(TapUpDetails)? onTapUp;
  final Function(TapDownDetails)? onTapDown;

  const CustomElevatedButton({
    super.key,
    this.child,
    this.color,
    this.hoverColor,
    this.height,
    this.width,
    this.borderRadius,
    this.verPadding,
    this.horPadding,
    required this.onPressed,
    this.borderWidth,
    this.borderColor,
    this.isShadow,
    this.shadowColor,
    this.alignment,
    this.onFocusChange,
    this.onTapUp,
    this.onTapDown,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: height ?? 40,
      width: width,
      verPadding: verPadding,
      horPadding: horPadding ?? 10,
      onTap: onPressed,
      onTapUp: onTapUp,
      onTapDown: onTapDown,
      borderRadius: borderRadius ?? 40,
      borderWidth: borderWidth,
      isShadow: isShadow,
      topBorder: true,
      rightBorder: true,
      bottomBorder: true,
      leftBorder: true,
      borderColor: Colors.grey.shade400,
      shadowColor: shadowColor,
      alignment: alignment,
      color: color ?? Theme.of(context).colorScheme.primary,
      child: child,
    );
  }
}
