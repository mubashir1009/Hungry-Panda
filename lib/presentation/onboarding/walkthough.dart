import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodpractice/core/constants/app_text.dart';
import 'package:riverpodpractice/core/constants/assets.dart';
import 'package:riverpodpractice/core/services/walkthrough_notifier.dart';
import 'package:riverpodpractice/presentation/onboarding/lets_you_in.dart';
import 'package:riverpodpractice/presentation/onboarding/walkthrough_widgets.dart';
import 'package:riverpodpractice/widgets/custom_elevated_button.dart';
import 'package:riverpodpractice/widgets/custom_text_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Walkthough extends ConsumerWidget {
  final walkthroughItems = [
    {
      'imagePath': walkthrough1Logo,
      'title': orderOfFood,
      'subTitle': walkthough1Subtitle,
    },
    {
      'imagePath': walkthrough2Logo,
      'title': easyPayment,
      'subTitle': walkthough2Subtitle,
    },
    {
      'imagePath': walkthrough3Logo,
      'title': fastDelivery,
      'subTitle': walkthough3Subtitle,
    },
  ];
  Walkthough({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Consumer(
              builder: (context, ref, _) {
                final selectedIndex = ref.watch(pageIndicatorProvider);
                return WalkthroughWidgets(
                  imagePath: walkthroughItems[selectedIndex]['imagePath'] ?? '',
                  title: walkthroughItems[selectedIndex]['title'] ?? '',
                  subTitle: walkthroughItems[selectedIndex]['subTitle'] ?? '',
                );
              },
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer(
                  builder: (context, ref, _) {
                    return AnimatedSmoothIndicator(
                      activeIndex: ref.watch(pageIndicatorProvider),
                      count: 3,
                      effect: ExpandingDotsEffect(
                        activeDotColor: colorScheme.primary,
                        dotHeight: 14,
                        dotWidth: 14,
                      ),
                    );
                  },
                ),
                SizedBox(height: 30),
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
                          if (ref.read(pageIndicatorProvider) < 2) {
                            ref.read(pageIndicatorProvider.notifier).state++;
                          } else {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LetsYouIn(),
                              ),
                            );
                          }
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
          ],
        ),
      ),
    );
  }
}
