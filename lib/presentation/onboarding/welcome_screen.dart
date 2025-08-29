import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodpractice/core/constants/app_text.dart';
import 'package:riverpodpractice/core/constants/assets.dart';
import 'package:riverpodpractice/core/services/walkthrough_notifier.dart';
import 'package:riverpodpractice/presentation/onboarding/walkthough.dart';
import 'package:riverpodpractice/widgets/custom_animated_container.dart';
import 'package:riverpodpractice/widgets/custom_elevated_button.dart';
import 'package:riverpodpractice/widgets/custom_text_widget.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
              color: colorScheme.onPrimary,
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
            SizedBox(height: 20,),
            Consumer(
              builder: (context, ref, _) {
                final isTapped = ref.watch(buttonTappedNotifier);
                return AnimatedScale(
                  duration: Duration(milliseconds: 300),
                  scale: isTapped ? 0.97 : 1,
                  child: CustomElevatedButton(
                    onTapUp:
                        (_) =>
                            ref.read(buttonTappedNotifier.notifier).state =
                                false,
                    onTapDown:
                        (_) =>
                            ref.read(buttonTappedNotifier.notifier).state =
                                true,
                    height: 44,
                    color: Colors.transparent,
                    shadowColor: Colors.transparent,
                    borderColor: colorScheme.onPrimary,
                    borderWidth: 2,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Walkthough()),
                      );
                    },
                    child: CustomTextWidget(
                      text: next,
                      color: colorScheme.onPrimary,
                      fontSize: 20,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
