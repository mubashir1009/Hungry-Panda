import 'package:flutter/material.dart';
import 'package:riverpodpractice/widgets/custom_text_widget.dart';

class WalkthroughWidgets extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subTitle;
  const WalkthroughWidgets({ 
    super.key,
    required this.imagePath,
    required this.subTitle,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 260,
            width: 260,
            child: Image.asset(imagePath, fit: BoxFit.cover),
          ),
          CustomTextWidget(
            text: title,
            color: colorScheme.primary,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.clip,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          CustomTextWidget(
            text: subTitle,
            overflow: TextOverflow.clip,
            color: colorScheme.onSurface,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
