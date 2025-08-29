import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:riverpodpractice/core/services/auth_notifier.dart';

class CustomPhoneField extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final String? hint;
  final double? radius;
  final double? borderWidth;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? fillColor;
  final Color? labelColor;
  final Color? hintColor;
  final double? labelFontSize;
  final double? hintFontSize;
  final Widget? preffixIcon;  
  final Widget? suffixIcon;  

  const CustomPhoneField({
    super.key,
    required this.controller,
    this.label,
    this.hint,
    this.radius,
    this.borderWidth,
    this.borderColor,
    this.focusedBorderColor,
    this.fillColor,
    this.labelColor,
    this.hintColor,
    this.labelFontSize,
    this.hintFontSize,
    this.preffixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: controller,
      initialCountryCode: 'PK',
      dropdownDecoration: BoxDecoration(
        
      ),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        filled: true,
        fillColor: fillColor,
        labelStyle: TextStyle(
          color: labelColor ?? Theme.of(context).colorScheme.onSecondary,
          fontSize: labelFontSize ?? 16,
        ),
        hintStyle: TextStyle(
          color: hintColor ?? Theme.of(context).colorScheme.onSecondary,
          fontSize: hintFontSize ?? 14,
        ),
        prefixIcon: preffixIcon, 
        suffixIcon: suffixIcon,  
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
            color: focusedBorderColor ?? Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      
      onChanged: (phone) {
        countryCode.text = phone.countryCode;
      },
    );
  }
}
