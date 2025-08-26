import 'package:flutter/material.dart';
import 'package:riverpodpractice/core/constants/app_text.dart';
import 'package:riverpodpractice/core/constants/assets.dart';
import 'package:riverpodpractice/presentation/onboarding_screen_2.dart';
import 'package:riverpodpractice/widgets/custom_animated_container.dart';
import 'package:riverpodpractice/widgets/custom_elevated_button.dart';
import 'package:riverpodpractice/widgets/custom_svg_widget.dart';
import 'package:riverpodpractice/widgets/custom_text_widget.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.secondary,
      body: Column(
        children: [
          CustomAnimatedContainer(
            height: MediaQuery.of(context).size.height * 0.6,
            bottomLeftRadius: 10,
            bottomRightRadius: 10,
            horPadding: 40,
            color: colorScheme.primary,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(bucket2),
                  SizedBox(height: 4),
                  SvgWidget(
                    image: bucketShadow,
                    color: Color.fromARGB(255, 240, 134, 38),
                    isColor: true,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextWidget(text: welcomeText, fontWeight: FontWeight.bold),
                  SizedBox(height: 10),
                  CustomTextWidget(text: welcomeSubtitleText, overflow: TextOverflow.clip,),
                  SizedBox(height: 20),
                  CustomElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => OnboardingScreen2()),
                      );
                    },
                    child: CustomTextWidget(text: getStartedText),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
