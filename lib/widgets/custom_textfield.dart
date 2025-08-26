import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final double? height;
  final double? radius;
  final double? width;
  final double? labelFontSize;
  final double? hintFontSize;
  final Color? fillColor;
  final Color? labelColor;
  final Color? hintColor;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final double? borderWidth;
  final TextEditingController controller;
  final bool? isObsecure;
  final bool? readOnly;
  final VoidCallback? onToggleObscure;
  final Widget? suffixIcon;
  final Widget? preffixIcon;
  final Widget? preffix;
  final Color? suffixIconColor;
  final Color? preffixIconColor;
  final ScrollController? scrollController;
  final ValueChanged? onChanged;
  final FocusNode? focusNode;
  final GestureTapCallback? onTap;
  final ValueChanged? onSubmitted;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final int? maxLines;
  final double? horContentPadding;
  final double? verContentPadding;
  final Function(PointerDownEvent)? onTapOutside;

  const CustomTextField({
    super.key,
    this.label,
    this.hint,
    this.borderColor,
    this.borderWidth,
    required this.controller,
    this.fillColor,
    this.focusedBorderColor,
    this.height,
    this.hintColor,
    this.hintFontSize,
    this.isObsecure,
    this.readOnly,
    this.labelColor,
    this.labelFontSize,
    this.onToggleObscure,
    this.preffixIcon,
    this.preffix,
    this.preffixIconColor,
    this.radius,
    this.suffixIcon,
    this.suffixIconColor,
    this.width,
    this.scrollController,
    this.onChanged,
    this.onTap,
    this.focusNode,
    this.onSubmitted,
    this.textInputType,
    this.textInputAction,
    this.maxLines,
    this.horContentPadding,
    this.verContentPadding,
    this.onTapOutside,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextField(
        onTap: onTap,
        controller: controller,
        obscureText: isObsecure ?? false,
        onChanged: onChanged,
        focusNode: focusNode,
        onTapOutside: onTapOutside,
        onSubmitted: onSubmitted,
        keyboardType: textInputType,
        textInputAction: textInputAction,
        maxLines: maxLines ?? 1,
        readOnly: readOnly ?? false,
        style: TextStyle(
          color: labelColor ?? Theme.of(context).colorScheme.onSecondary,
          fontSize: labelFontSize ?? 20,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: fillColor ?? Theme.of(context).colorScheme.secondary,
          labelText: label,
          labelStyle: TextStyle(
            color: labelColor ?? Theme.of(context).colorScheme.onSecondary,
            fontSize: labelFontSize ?? 20,
          ),

          hintText: hint,
          hintStyle: TextStyle(
            color: hintColor ?? Theme.of(context).colorScheme.onSecondary,
            fontSize: hintFontSize ?? 16,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 40),
            borderSide: BorderSide(
              width: borderWidth ?? 0,
              color: borderColor ?? Theme.of(context).colorScheme.onSecondary,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 40),
            borderSide: BorderSide(
              width: borderWidth ?? 0,
              color: borderColor ?? Theme.of(context).colorScheme.onSecondary,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 40),
            borderSide: BorderSide(
              width: borderWidth ?? 0,
              color:
                  focusedBorderColor ?? Theme.of(context).colorScheme.primary,
            ),
          ),
          prefixIcon: preffixIcon,
          prefix: preffix,
          suffixIcon: suffixIcon,
          contentPadding: EdgeInsets.symmetric(
            horizontal: horContentPadding ?? 10,
            vertical: verContentPadding ?? 0,
          ),
        ),
      ),
    );
  }
}
