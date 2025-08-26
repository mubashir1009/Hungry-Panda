import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextDecoration? dec;
  final bool isSelectable;

  const CustomTextWidget({
    super.key,
    required this.text,
    this.fontSize = 16,
    this.color,
    this.fontWeight = FontWeight.normal,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.dec,
    this.isSelectable = false, 
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontSize: fontSize,
      color: color ?? Theme.of(context).colorScheme.onSecondary,
      fontWeight: fontWeight,
      decoration: dec ?? TextDecoration.none,
      overflow: overflow ?? TextOverflow.ellipsis,
    );

    if (isSelectable) {
      return SelectableText(
        text,
        style: textStyle,
        textAlign: textAlign ?? TextAlign.start,
        maxLines: maxLines,
      );
    } else {
      return Text(
        text,
        style: textStyle,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow ?? TextOverflow.ellipsis,
      );
    }
  }
}
