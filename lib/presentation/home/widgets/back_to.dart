import 'package:flutter/material.dart';
import 'package:riverpodpractice/core/constants/app_text.dart';
import 'package:riverpodpractice/widgets/custom_text_widget.dart';

class BackTo extends StatelessWidget {
  final String title;
  final Color? iconColor;
  const BackTo({super.key, required this.title, this.iconColor});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back, color: iconColor ?? colorScheme.primary),
            ),
            SizedBox(width: 8),
            CustomTextWidget(
              text: title,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
        title == cart
            ? IconButton(
              onPressed: () {
                
              },
              icon: Icon(Icons.more_horiz_rounded, color: colorScheme.primary),
            )
            : SizedBox(),
      ],
    );
  }
}
