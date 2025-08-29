import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodpractice/core/constants/app_text.dart';
import 'package:riverpodpractice/core/constants/assets.dart';
import 'package:riverpodpractice/core/services/walkthrough_notifier.dart';
import 'package:riverpodpractice/presentation/authentication/login_screen.dart';
import 'package:riverpodpractice/presentation/authentication/signup_screen.dart';
import 'package:riverpodpractice/widgets/custom_elevated_button.dart';
import 'package:riverpodpractice/widgets/custom_text_widget.dart';

class LetsYouIn extends StatelessWidget {
  const LetsYouIn({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 230, width: 230, child: Image.asset(letYouInLogo)),
            CustomTextWidget(
              text: letsYouIn,
              color: colorScheme.onSurface,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.clip,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Consumer(
              builder: (context, ref, _) {
                final isTapped = ref.watch(googleButtonTappedNotifier);
                return AnimatedScale(
                  duration: Duration(milliseconds: 300),
                  scale: isTapped ? 0.97 : 1,
                  child: CustomElevatedButton(
                    onTapUp:
                        (_) =>
                            ref
                                .read(googleButtonTappedNotifier.notifier)
                                .state = false,
                    onTapDown:
                        (_) =>
                            ref
                                .read(googleButtonTappedNotifier.notifier)
                                .state = true,
                    onPressed: () {},
                    color: colorScheme.surface,
                    borderWidth: 1,
                    borderRadius: 8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 25,
                          width: 25,
                          child: Image.asset(googleLogo),
                        ),
                        SizedBox(width: 10),
                        CustomTextWidget(
                          text: continueWithGoogle,
                          color: colorScheme.onSurface,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Divider(color: Colors.grey.shade400, thickness: 1),
                ),
                SizedBox(width: 8),
                CustomTextWidget(
                  text: orText,
                  color: Colors.grey,
                  textAlign: TextAlign.center,
                ),
                SizedBox(width: 8),
                Expanded(child: Divider(color: Colors.grey.shade400)),
              ],
            ),
            SizedBox(height: 20),
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
                    isShadow: true,
                    shadowColor: colorScheme.primary.withAlpha(100),
                    borderColor: Colors.transparent,
                    borderWidth: 0,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: CustomTextWidget(
                      text: signInWithEmail,
                      color: colorScheme.onPrimary,
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextWidget(
                  text: dontHaveAcc,
                  color: Colors.grey.shade400,
                  textAlign: TextAlign.center,
                ),
                SizedBox(width: 8),
                InkWell(
                  onTap:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupScreen()),
                      ),
                  child: CustomTextWidget(
                    text: signupText,
                    color: colorScheme.primary,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
