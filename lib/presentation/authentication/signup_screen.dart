import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodpractice/core/constants/app_text.dart';
import 'package:riverpodpractice/core/constants/assets.dart';
import 'package:riverpodpractice/core/services/auth_notifier.dart';
import 'package:riverpodpractice/core/services/walkthrough_notifier.dart';
import 'package:riverpodpractice/presentation/authentication/verify_phone.dart';
import 'package:riverpodpractice/widgets/custom_phone_field.dart';
import 'package:riverpodpractice/widgets/custom_checkbox.dart';
import 'package:riverpodpractice/widgets/custom_elevated_button.dart';
import 'package:riverpodpractice/widgets/custom_svg_widget.dart';
import 'package:riverpodpractice/widgets/custom_text_widget.dart';
import 'package:riverpodpractice/widgets/custom_textformfield.dart';

class SignupScreen extends ConsumerWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back, color: colorScheme.primary),
                ),
              ],
            ),
            Expanded(
              child: Form(
                key: signupFormKey,
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
                        text: createAccount,
                        color: colorScheme.onSurface,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      CustomPhoneField(
                        controller: contactController,
                        hint: '321000000',
                        preffixIcon: Icon(Icons.phone, color: Colors.grey),
                        hintColor: Colors.grey.shade400,
                        borderWidth: 1,
                        borderColor: Colors.grey,
                        focusedBorderColor: colorScheme.primary,
                        radius: 10,
                      ),
                      SizedBox(height: 8),
                      CustomTextFormField(
                        controller: nameController,
                        hint: 'Full Name',
                        preffixIcon: Transform.scale(
                          scale: 0.5,
                          child: SvgWidget(
                            image: user,
                            color: Colors.grey,
                            isColor: true,
                          ),
                        ),
                        hintColor: Colors.grey.shade400,
                        borderWidth: 1,
                        borderColor: Colors.grey,
                        focusedBorderColor: colorScheme.primary,
                        radius: 10,
                      ),
                      SizedBox(height: 8),
                      CustomTextFormField(
                        controller: emailController,
                        hint: 'Email',
                        isEmailField: true,
                        preffixIcon: Transform.scale(
                          scale: 0.5,
                          child: SvgWidget(
                            image: email,
                            color: Colors.grey,
                            isColor: true,
                          ),
                        ),
                        hintColor: Colors.grey.shade400,
                        borderWidth: 1,
                        borderColor: Colors.grey,
                        focusedBorderColor: colorScheme.primary,
                        radius: 10,
                      ),
                      SizedBox(height: 8),
                      Consumer(
                        builder: (context, ref, _) {
                          return CustomTextFormField(
                            controller: passwordController,
                            hint: 'Password',
                            isPasswordField: true,
                            isObsecure: ref.watch(passwordNotifier),
                            onToggleObscure: () {
                              ref.read(passwordNotifier.notifier).state =
                                  !ref.read(passwordNotifier.notifier).state;
                            },
                            suffixIconColor: Colors.grey,
                            preffixIcon: Transform.scale(
                              scale: 0.5,
                              child: SvgWidget(
                                image: password,
                                color: Colors.grey,
                                isColor: true,
                              ),
                            ),
                            hintColor: Colors.grey.shade400,
                            borderWidth: 1,
                            borderColor: Colors.grey,
                            focusedBorderColor: colorScheme.primary,
                            radius: 10,
                          );
                        },
                      ),
                      SizedBox(height: 8),
                      Consumer(
                        builder: (context, ref, _) {
                          return CustomTextFormField(
                            controller: confirmPasswordController,
                            hint: 'Confirm Password',
                            isObsecure: ref.watch(confirmPasswordNotifier),
                            onToggleObscure: () {
                              ref.read(confirmPasswordNotifier.notifier).state =
                                  !ref
                                      .read(confirmPasswordNotifier.notifier)
                                      .state;
                            },
                            preffixIcon: Transform.scale(
                              scale: 0.5,
                              child: SvgWidget(
                                image: password,
                                color: Colors.grey,
                                isColor: true,
                              ),
                            ),
                            hintColor: Colors.grey.shade400,
                            borderWidth: 1,
                            suffixIconColor: Colors.grey,
                            isConfirmPasswordField: true,
                            borderColor: Colors.grey,
                            focusedBorderColor: colorScheme.primary,
                            radius: 10,
                          );
                        },
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
                              onPressed: () async {
                                if (signupFormKey.currentState!.validate()) {
                                  // sendOTP();
                                  oneMinuteTimer(ref);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => VerifyPhone(),
                                    ),
                                  );
                                }
                              },
                              child: CustomTextWidget(
                                text: signUp,
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
                          CustomTextWidget(
                            text: alreadyHaveAcc,
                            color: Colors.grey.shade400,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(width: 8),
                          InkWell(
                            onTap: () {
                              resetFields();
                              Navigator.pop(context);
                            },
                            child: CustomTextWidget(
                              text: signinTextWithSpace,
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
