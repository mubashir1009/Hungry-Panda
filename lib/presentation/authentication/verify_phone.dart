import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:riverpodpractice/core/constants/app_text.dart';
import 'package:riverpodpractice/core/model/user_model.dart';
import 'package:riverpodpractice/core/services/auth_notifier.dart';
import 'package:riverpodpractice/core/services/firebase_services.dart';
import 'package:riverpodpractice/core/services/walkthrough_notifier.dart';
import 'package:riverpodpractice/widgets/custom_animated_container.dart';
import 'package:riverpodpractice/widgets/custom_elevated_button.dart';
import 'package:riverpodpractice/widgets/custom_pinput.dart';
import 'package:riverpodpractice/widgets/custom_text_widget.dart';

class VerifyPhone extends StatelessWidget {
  const VerifyPhone({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
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
                SizedBox(width: 8),
                CustomTextWidget(
                  text: otpVerification,
                  color: colorScheme.onSurface,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(top: 40, left: 15, right: 15),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    CustomAnimatedContainer(
                      height: 300,
                      color: colorScheme.surface,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextWidget(
                            text:
                                '$otpVerificationSubtitle ${contactController.text}',
                            color: colorScheme.onSurface,
                            overflow: TextOverflow.clip,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 30),
                          Directionality(
                            textDirection: TextDirection.ltr,
                            child: CustomPinput(
                              borderRadius: 12,
                              cursorColor: colorScheme.primary,
                              errorPinBoxColor: colorScheme.error,
                              focusedPinBoxColor: colorScheme.primary.withAlpha(
                                40,
                              ),
                              focusedPinBoxBorderColor: colorScheme.primary,
                              length: 4,
                              pinBoxHeight: 50,
                              pinBoxWidth: 60,
                              submitPinBoxBorderColor: Colors.grey.withAlpha(
                                80,
                              ),
                              submitPinBoxColor: Colors.grey.withAlpha(10),
                              textColor: colorScheme.onSurface,
                              textFontSize: 20,
                            ),
                          ),
                          SizedBox(height: 30),
                          Consumer(
                            builder: (context, ref, _) {
                              final count = ref.watch(counterNotifier);
                              return count == 0
                                  ? InkWell(
                                    onTap: () {
                                      oneMinuteTimer(ref);
                                    },
                                    child: CustomTextWidget(
                                      text: resendCode,
                                      color: colorScheme.primary,
                                      overflow: TextOverflow.clip,
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                  : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CustomTextWidget(
                                        text: resendCodeIn,
                                        color: colorScheme.onSurface,
                                        overflow: TextOverflow.clip,
                                        textAlign: TextAlign.center,
                                      ),
                                      CustomTextWidget(
                                        text: ' $count ',
                                        color: colorScheme.primary,
                                        overflow: TextOverflow.clip,
                                        textAlign: TextAlign.center,
                                      ),
                                      CustomTextWidget(
                                        text: 's',
                                        color: colorScheme.onSurface,
                                        overflow: TextOverflow.clip,
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  );
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
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
                            onPressed: () async {
                              if (!isVerifying) {
                                ref.read(verifyingNotifier.notifier).state =
                                    true;
                                final user = UserModel(
                                  email: emailController.text,
                                  contact: contactController.text,
                                  imageUrl: '',
                                  name: nameController.text,
                                  address: '',
                                );
                                await FirebaseServices.createUser(user, context, ref);
                                
                              }
                            },
                            child:
                                isVerifying
                                    ? LoadingAnimationWidget.threeArchedCircle(
                                      color: colorScheme.onPrimary,
                                      size: 20,
                                    )
                                    : CustomTextWidget(
                                      text: verify,
                                      color: colorScheme.onPrimary,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
