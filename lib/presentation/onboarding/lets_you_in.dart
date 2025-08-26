import 'package:flutter/material.dart';
import 'package:riverpodpractice/core/constants/app_text.dart';
import 'package:riverpodpractice/core/constants/assets.dart';
import 'package:riverpodpractice/widgets/custom_elevated_button.dart';
import 'package:riverpodpractice/widgets/custom_text_widget.dart';

class LetsYouIn extends StatelessWidget {
  const LetsYouIn({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextWidget(
              text: letsYouIn,
              color: colorScheme.onSurface,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.clip,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20,),
            CustomElevatedButton(
              onPressed: () {},
              color: colorScheme.surface,
              borderWidth: 1,
              borderRadius: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 25, width: 25, child: Image.asset(googleLogo)),
                  SizedBox(width: 10,),
                  CustomTextWidget(
                    text: continueWithGoogle,
                    color: colorScheme.onSurface,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
