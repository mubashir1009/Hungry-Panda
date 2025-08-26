import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:riverpodpractice/core/constants/app_text.dart';
import 'package:riverpodpractice/core/constants/assets.dart';
import 'package:riverpodpractice/presentation/onboarding/welcome_screen.dart';
import 'package:riverpodpractice/widgets/custom_text_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Stack(
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 70, width: 70, child: Image.asset(appLogo)),
                CustomTextWidget(
                  text: hungryPanda,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 60,
            left: MediaQuery.of(context).size.width * 0.5 - 15,
            child: LoadingAnimationWidget.threeArchedCircle(
              color: Colors.green,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
