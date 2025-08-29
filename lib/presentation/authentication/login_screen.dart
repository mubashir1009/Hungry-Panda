import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:riverpodpractice/core/constants/app_text.dart';
import 'package:riverpodpractice/core/constants/assets.dart';
import 'package:riverpodpractice/core/services/auth_notifier.dart';
import 'package:riverpodpractice/core/services/firebase_services.dart';
import 'package:riverpodpractice/core/services/walkthrough_notifier.dart';
import 'package:riverpodpractice/presentation/authentication/signup_screen.dart';
import 'package:riverpodpractice/widgets/custom_checkbox.dart';
import 'package:riverpodpractice/widgets/custom_elevated_button.dart';
import 'package:riverpodpractice/widgets/custom_text_widget.dart';
import 'package:riverpodpractice/widgets/custom_textformfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Form(
                key: signinFormKey,
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 150,
                        width: 150,
                        child: Image.asset(appLogo),
                      ),
                      CustomTextWidget(
                        text: loginToAcc,
                        color: colorScheme.onSurface,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      CustomTextFormField(
                        controller: emailController,
                        hint: 'Email',
                        preffixIcon: Icon(Icons.email, color: Colors.grey),
                        hintColor: Colors.grey.shade400,
                        borderWidth: 1,
                        borderColor: Colors.grey,
                        focusedBorderColor: colorScheme.primary,
                        radius: 10,
                      ),
                      SizedBox(height: 8),
                      CustomTextFormField(
                        controller: nameController,
                        hint: 'Password',
                        preffixIcon: Icon(Icons.person, color: Colors.grey),
                        hintColor: Colors.grey.shade400,
                        borderWidth: 1,
                        borderColor: Colors.grey,
                        focusedBorderColor: colorScheme.primary,
                        radius: 10,
                      ),
                      SizedBox(height: 12),
                      Row(
                        children: [
                          Consumer(
                            builder: (context, ref, _) {
                              final isChecked = ref.watch(checkBoxNotifier);
                              return Transform.scale(
                                scale: 1.2,
                                child: CustomCheckbox(
                                  value: isChecked,
                                  borderColor: colorScheme.primary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  onChanged: (val) {
                                    ref.read(checkBoxNotifier.notifier).state =
                                        val!;
                                  },
                                ),
                              );
                            },
                          ),
                          CustomTextWidget(
                            text: 'Remember me',
                            color: colorScheme.onSurface,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Consumer(
                        builder: (context, ref, _) {
                          final isTapped = ref.watch(buttonTappedNotifier);
                          final isVerifying = ref.watch(verifyingNotifier);
                          return AnimatedScale(
                            duration: Duration(milliseconds: 300),
                            scale: isTapped ? 0.97 : 1,
                            child: CustomElevatedButton(
                              onTapUp:
                                  (_) =>
                                      ref
                                          .read(buttonTappedNotifier.notifier)
                                          .state = false,
                              onTapDown:
                                  (_) =>
                                      ref
                                          .read(buttonTappedNotifier.notifier)
                                          .state = true,
                              height: 44,
                              isShadow: true,
                              shadowColor: colorScheme.primary.withAlpha(100),
                              borderColor: Colors.transparent,
                              borderWidth: 0,
                              onPressed: () {
                                if (signinFormKey.currentState!.validate()) {
                                  FirebaseServices.signinUser(ref, context);
                                }
                              },
                              child:
                                  isVerifying
                                      ? LoadingAnimationWidget.threeArchedCircle(
                                        color: colorScheme.onPrimary,
                                        size: 20,
                                      )
                                      : CustomTextWidget(
                                        text: signinText,
                                        color: colorScheme.onPrimary,
                                        fontWeight: FontWeight.bold,
                                      ),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 20),
                      CustomTextWidget(
                        text: orContinueWith,
                        color: Colors.grey,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      Consumer(
                        builder: (context, ref, _) {
                          final isTapped = ref.watch(
                            googleButtonTappedNotifier,
                          );
                          return AnimatedScale(
                            duration: Duration(milliseconds: 300),
                            scale: isTapped ? 0.97 : 1,
                            child: CustomElevatedButton(
                              onTapUp:
                                  (_) =>
                                      ref
                                          .read(
                                            googleButtonTappedNotifier.notifier,
                                          )
                                          .state = false,
                              onTapDown:
                                  (_) =>
                                      ref
                                          .read(
                                            googleButtonTappedNotifier.notifier,
                                          )
                                          .state = true,
                              onPressed: () async {
                                try {
                                  final userCredential =
                                      await FirebaseServices.signInWithGoogle();
                                  if (userCredential != null) {
                                    log(
                                      "Signed in: ${userCredential.user?.email}",
                                    );
                                    await FirebaseServices.fetchUser();
                                  }
                                } catch (e) {
                                  log("Google Sign-In Failed: $e");
                                }
                              },
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
                          CustomTextWidget(
                            text: dontHaveAcc,
                            color: Colors.grey.shade400,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(width: 8),
                          InkWell(
                            onTap: () {
                              resetFields();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignupScreen(),
                                ),
                              );
                            },
                            child: CustomTextWidget(
                              text: signupText,
                              color: colorScheme.primary,
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
