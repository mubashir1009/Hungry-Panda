import 'dart:async';
import 'package:flutter/material.dart';
import 'package:riverpodpractice/core/constants/assets.dart';
import 'package:riverpodpractice/presentation/onboarding/walkthough.dart';
import 'package:riverpodpractice/widgets/custom_animated_container.dart';
import 'package:riverpodpractice/widgets/custom_text_widget.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Walkthough()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: CustomAnimatedContainer(
        color: colorScheme.surface,
        alignment: Alignment.bottomCenter,
        horPadding: 20,
        verPadding: 40,
        isImage: true,
        imagePath: welcomeScreenImage,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomTextWidget(
              text: 'Welcome to Hungry Panda!',
              color: colorScheme.primary,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.clip,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            CustomTextWidget(
              text: 'Satisfy your hunger with flavors that make you smile.',
              fontSize: 20,
              overflow: TextOverflow.clip,
              color: colorScheme.onPrimary,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
