import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgWidget extends StatelessWidget {
  final String image;
  final Color? color;
  final double? height;
  final double? width;
  final bool? isColor;
  const SvgWidget({
    super.key,
    required this.image,
    this.color,
    this.height,
    this.width,
    this.isColor,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      image,
      height: height ?? 20,
      width: width ?? 20,
      colorFilter:
          isColor ?? false
              ? ColorFilter.mode(
                color ?? Theme.of(context).colorScheme.onSecondary,
                BlendMode.srcIn,
              )
              : null,
    );
  }
}
