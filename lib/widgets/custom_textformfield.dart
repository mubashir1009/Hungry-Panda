import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
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
  final double? horContentPadding;
  final double? verContentPadding;
  final TextEditingController controller;
  final bool? isObsecure;
  final bool? isPasswordField;
  final bool? isConfirmPasswordField;
  final bool? isContactField;
  final bool? isDialogField;
  final bool? isEmailField;
  final bool? enabled;
  final bool isNameValidation;
  final bool? isValidationDisabled;
  final bool? readOnly;
  final VoidCallback? onToggleObscure;
  final Widget? suffixIcon;
  final Widget? preffixIcon;
  final Color? suffixIconColor;
  final Color? preffixIconColor;
  final FocusNode? focusNode;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final int? maxLines;
  final Iterable<String>? autoFillHints;
  final Function(String)? onFieldSubmitted;

  CustomTextFormField({
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
    this.enabled,
    this.hintFontSize,
    this.isConfirmPasswordField,
    this.isContactField,
    this.isEmailField,
    this.isObsecure,
    this.isNameValidation = false,
    this.isValidationDisabled,
    this.isPasswordField,
    this.isDialogField,
    this.labelColor,
    this.horContentPadding,
    this.verContentPadding,
    this.labelFontSize,
    this.onToggleObscure,
    this.preffixIcon,
    this.preffixIconColor,
    this.radius,
    this.suffixIcon,
    this.suffixIconColor,
    this.width,
    this.focusNode,
    this.textInputType,
    this.textInputAction,
    this.maxLines,
    this.autoFillHints,
    this.onFieldSubmitted,
    this.readOnly,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
        enabled: enabled ?? true,
        controller: controller,
        onChanged: (value) {},
        obscureText: isObsecure ?? false,
        focusNode: focusNode,
        textInputAction: textInputAction,
        maxLines: maxLines ?? 1,
        readOnly: readOnly ?? false,
        onFieldSubmitted: onFieldSubmitted,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: fillColor,
          labelStyle: TextStyle(
            color: labelColor ?? Theme.of(context).colorScheme.onSecondary,
            fontSize: labelFontSize ?? 16,
          ),
          hintText: hint,
          hintStyle: TextStyle(
            color: hintColor ?? Theme.of(context).colorScheme.onSecondary,
            fontSize: hintFontSize ?? 14,
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
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 40),
            borderSide: BorderSide(
              width: borderWidth ?? 0,
              color: Theme.of(context).colorScheme.error,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 40),
            borderSide: BorderSide(
              width: borderWidth ?? 0,
              color: Theme.of(context).colorScheme.error,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 40),
            borderSide: BorderSide(
              width: borderWidth ?? 0,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 40),
            borderSide: BorderSide(width: borderWidth ?? 0, color: Colors.grey),
          ),

          suffixIcon:
              isPasswordField ?? false
                  ? IconButton(
                    onPressed: onToggleObscure,
                    icon: Icon(
                      isObsecure ?? false
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  )
                  : isConfirmPasswordField ?? false
                  ? IconButton(
                    onPressed: onToggleObscure,
                    icon: Icon(
                      isObsecure ?? false
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  )
                  : null,
          contentPadding: EdgeInsets.symmetric(
            horizontal: horContentPadding ?? 10,
            vertical: verContentPadding ?? 0,
          ),
        ),
        autofillHints: autoFillHints,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType:
            isEmailField ?? false
                ? TextInputType.emailAddress
                : isContactField ?? false
                ? TextInputType.number
                : textInputType ?? TextInputType.text,
        validator: (value) {
          return value!.isEmpty ? hint : null;
        },
      ),
    );
  }
}
