import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:riverpodpractice/core/services/auth_notifier.dart';
import 'package:riverpodpractice/widgets/custom_animated_container.dart';

class CustomPinput extends StatelessWidget {
  final double pinBoxHeight;
  final double pinBoxWidth;
  final double textFontSize;
  final double borderRadius;
  final Color textColor;
  final Color cursorColor;
  final Color focusedPinBoxColor;
  final Color focusedPinBoxBorderColor;
  final Color submitPinBoxBorderColor;
  final Color errorPinBoxColor;
  final Color submitPinBoxColor;
  final int length;

  const CustomPinput({
    super.key,
    required this.borderRadius,
    required this.cursorColor,
    required this.errorPinBoxColor,
    required this.focusedPinBoxBorderColor,
    required this.length,
    required this.focusedPinBoxColor,
    required this.pinBoxHeight,
    required this.pinBoxWidth,
    required this.submitPinBoxBorderColor,
    required this.submitPinBoxColor,
    required this.textColor,
    required this.textFontSize,
  });

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: pinBoxWidth,
      height: pinBoxHeight,
      textStyle: TextStyle(fontSize: textFontSize, color: textColor),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: Colors.grey.shade400),
      ),
    );

    return Pinput(
      length: length,
      controller: pinController,
      defaultPinTheme: defaultPinTheme,
      hapticFeedbackType: HapticFeedbackType.lightImpact,
      onCompleted: (pin) => debugPrint('onCompleted: $pin'),
      onChanged: (value) => debugPrint('onChanged: $value'),
      cursor: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomAnimatedContainer(width: 24, height: 2, color: cursorColor),
        ],
      ),
      focusedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          color: focusedPinBoxColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: focusedPinBoxBorderColor),
        ),
      ),
      submittedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          color: submitPinBoxColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: submitPinBoxBorderColor),
        ),
      ),
      errorPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          border: Border.all(color: errorPinBoxColor),
        ),
      ),
    );
  }
}
