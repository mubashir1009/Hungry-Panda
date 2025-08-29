import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodpractice/core/constants/assets.dart';
import 'package:riverpodpractice/core/services/home_notifier.dart';
import 'package:riverpodpractice/widgets/custom_animated_container.dart';
import 'package:riverpodpractice/widgets/custom_elevated_button.dart';
import 'package:riverpodpractice/widgets/custom_text_widget.dart';

class OfferWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  const OfferWidget({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return CustomAnimatedContainer(
      color: Colors.grey.shade400.withAlpha(20),
      borderRadius: 10,
      horPadding: 10,
      verPadding: 8,
      verMargin: 4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    demoProfilePic,
                    height: 36,
                    width: 36,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 6),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(text: title, fontWeight: FontWeight.bold),
                      CustomTextWidget(
                        text: subTitle,
                        fontSize: 14,
                        color: Colors.grey.shade400,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Consumer(
            builder: (context, ref, _) {
              final isTapped = ref.watch(applyButtonNotifier);
              return AnimatedScale(
                duration: Duration(milliseconds: 300),
                scale: isTapped ? 0.95 : 1,
                child: CustomElevatedButton(
                  onTapUp:
                      (_) =>
                          ref.read(applyButtonNotifier.notifier).state = false,
                  onTapDown:
                      (_) =>
                          ref.read(applyButtonNotifier.notifier).state = true,
                  onPressed: () {},
                  height: 34,
                  color: colorScheme.primary,
                  borderWidth: 0,
                  borderRadius: 20,
                  child: CustomTextWidget(
                    text: 'Claim',
                    color: colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
