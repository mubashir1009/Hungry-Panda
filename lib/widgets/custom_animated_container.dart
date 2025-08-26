import 'package:flutter/material.dart';

class CustomAnimatedContainer extends StatelessWidget {
  final Widget? child;
  final Color? color;
  final Color? color2;
  final double? height;
  final double? width;
  final double? borderRadius;
  final double? topLeftRadius;
  final double? topRightRadius;
  final double? bottomLeftRadius;
  final double? bottomRightRadius;
  final double? verMargin;
  final double? horMargin;
  final double? verPadding;
  final double? horPadding;
  final GestureTapCallback? onTap;
  final double? borderWidth;
  final Color? borderColor;
  final bool? isShadow;
  final bool? isGradientColor;
  final bool? topBorder;
  final bool? leftBorder;
  final bool? rightBorder;
  final bool? bottomBorder;
  final bool? isImage;
  final String? imagePath;
  final Color? shadowColor;
  final Alignment? alignment;
  final double? blurRadius;
  final Function(TapDownDetails)? onTapDown;
  final Function(TapUpDetails)? onTapUp;
  final Function()? onEnd;
  final Duration? duration;

  const CustomAnimatedContainer({
    super.key,
    this.child,
    this.color,
    this.color2,
    this.height,
    this.width,
    this.borderRadius,
    this.topLeftRadius,
    this.topRightRadius,
    this.bottomLeftRadius,
    this.bottomRightRadius,
    this.verPadding,
    this.horPadding,
    this.rightBorder,
    this.topBorder,
    this.leftBorder,
    this.bottomBorder,
    this.verMargin,
    this.horMargin,
    this.onTap,
    this.borderWidth,
    this.borderColor,
    this.isGradientColor,
    this.isShadow,
    this.isImage,
    this.imagePath,
    this.shadowColor,
    this.alignment,
    this.duration,
    this.blurRadius,
    this.onTapDown,
    this.onTapUp,
    this.onEnd,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      onTapUp: onTapUp,
      onTapDown: onTapDown,
      child: AnimatedContainer(
        onEnd: onEnd,
        duration: duration ?? Duration(milliseconds: 100),
        height: height,
        width: width,
        alignment: alignment ?? Alignment.center,
        padding: EdgeInsets.symmetric(
          vertical: verPadding ?? 0,
          horizontal: horPadding ?? 0,
        ),
        margin: EdgeInsets.symmetric(
          vertical: verMargin ?? 0,
          horizontal: horMargin ?? 0,
        ),
        decoration: BoxDecoration(
          image:
              isImage ?? false
                  ? DecorationImage(
                    image: AssetImage(imagePath ?? 'assets/images/chatBg.png'),
                    fit: BoxFit.cover,
                  )
                  : null,
          color: color ?? Theme.of(context).colorScheme.secondary,
          gradient:
              isGradientColor ?? false
                  ? LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      color2 ?? Theme.of(context).colorScheme.surface,
                      color ?? Theme.of(context).colorScheme.primary,
                    ],
                  )
                  : null,
          border: Border(
            top:
                topBorder ?? false
                    ? BorderSide(
                      width: borderWidth ?? 1,
                      color:
                          borderColor ??
                          Theme.of(context).colorScheme.secondary,
                    )
                    : BorderSide.none,
            bottom:
                bottomBorder ?? false
                    ? BorderSide(
                      width: borderWidth ?? 1,
                      color:
                          borderColor ??
                          Theme.of(context).colorScheme.secondary,
                    )
                    : BorderSide.none,
            left:
                leftBorder ?? false
                    ? BorderSide(
                      width: borderWidth ?? 1,
                      color:
                          borderColor ??
                          Theme.of(context).colorScheme.secondary,
                    )
                    : BorderSide.none,
            right:
                rightBorder ?? false
                    ? BorderSide(
                      width: borderWidth ?? 1,
                      color:
                          borderColor ??
                          Theme.of(context).colorScheme.secondary,
                    )
                    : BorderSide.none,
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(bottomLeftRadius ?? borderRadius ?? 5),
            bottomRight: Radius.circular(
              bottomRightRadius ?? borderRadius ?? 5,
            ),
            topLeft: Radius.circular(topLeftRadius ?? borderRadius ?? 5),
            topRight: Radius.circular(topRightRadius ?? borderRadius ?? 5),
          ),
          boxShadow:
              isShadow ?? false
                  ? [
                    BoxShadow(
                      color:
                          shadowColor?.withAlpha(80) ?? Colors.black54,
                      blurRadius: blurRadius ?? 3,
                      spreadRadius: 1,
                      offset: Offset(0, 0),
                    ),
                  ]
                  : null,
        ),
        child: child,
      ),
    );
  }
}
