import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodpractice/core/constants/assets.dart';
import 'package:riverpodpractice/core/services/home_notifier.dart';
import 'package:riverpodpractice/core/services/walkthrough_notifier.dart';
import 'package:riverpodpractice/presentation/home/checkout/checkout_screen.dart';
import 'package:riverpodpractice/presentation/home/widgets/back_to.dart';
import 'package:riverpodpractice/widgets/custom_animated_container.dart';
import 'package:riverpodpractice/widgets/custom_elevated_button.dart';
import 'package:riverpodpractice/widgets/custom_text_widget.dart';

class ItemDetail extends StatelessWidget {
  const ItemDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAnimatedContainer(
                isImage: true,
                imagePath: offer1,
                topLeftRadius: 0,
                topRightRadius: 0,
                bottomLeftRadius: 10,
                bottomRightRadius: 10,
                height: 240,
                alignment: Alignment.topLeft,
                child: BackTo(title: '', iconColor: colorScheme.onPrimary),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: CustomTextWidget(
                  text: 'Special Chips',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              CustomAnimatedContainer(
                color: Colors.grey.shade400.withAlpha(40),
                borderRadius: 10,
                horPadding: 10,
                verPadding: 10,
                horMargin: 10,
                child: CustomTextWidget(
                  text: '''Special Crispy Chips 🥔✨
                    Our Special Crispy Chips are thinly sliced, golden-fried, and lightly seasoned to perfection. Each bite delivers a satisfying crunch followed by a burst of flavor that balances saltiness with a subtle hint of spice.       
                    - Taste: Crispy, savory, with a touch of smokiness and mild spice that lingers pleasantly.  
                    - Texture: Ultra-crunchy on the outside, light and airy inside.  
                    - Ingredients: Fresh hand-picked potatoes, sunflower oil, Himalayan pink salt, paprika, and a blend of natural herbs.  
                    - Experience: Perfect as a quick snack, side with your favorite meal, or paired with dips like cheese, salsa, or garlic mayo.  
                              ''',
                  color: Colors.grey,
                  fontSize: 14,
                  overflow: TextOverflow.clip,
                ),
              ),
              SizedBox(height: 16),
              CustomAnimatedContainer(
                borderRadius: 20,
                color: Colors.transparent,
                horPadding: 10,
                verPadding: 10,
                horMargin: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextWidget(
                          text: 'PKR: 500/-',
                          color: colorScheme.primary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        Row(
                          children: [
                            Consumer(
                              builder: (context, ref, _) {
                                final isTapped = ref.watch(resetButtonNotifier);
                                return AnimatedScale(
                                  duration: Duration(milliseconds: 100),
                                  scale: isTapped ? 0.90 : 1,
                                  child: CustomElevatedButton(
                                    onTapUp:
                                        (_) =>
                                            ref
                                                .read(
                                                  resetButtonNotifier.notifier,
                                                )
                                                .state = false,
                                    onTapDown:
                                        (_) =>
                                            ref
                                                .read(
                                                  resetButtonNotifier.notifier,
                                                )
                                                .state = true,
                                    onPressed: () {
                                      final currentQuantity = ref.read(
                                        itemQuantityNotifier.notifier,
                                      );
                                      if (currentQuantity.state > 0) {
                                        currentQuantity.state--;
                                        final basePrice = 500.0;
                                        ref
                                            .read(
                                              selectedItemPricenotifier
                                                  .notifier,
                                            )
                                            .state = basePrice *
                                            ref.read(itemQuantityNotifier);
                                      }
                                    },
                                    color: colorScheme.primary.withAlpha(60),
                                    borderWidth: 0,
                                    height: 40,
                                    width: 40,
                                    borderRadius: 20,
                                    child: CustomTextWidget(
                                      text: '-',
                                      color: colorScheme.primary,
                                      fontWeight: FontWeight.bold,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                );
                              },
                            ),
                            SizedBox(width: 12),
                            Consumer(
                              builder: (context, ref, _) {
                                final quantity = ref.watch(
                                  itemQuantityNotifier,
                                );
                                return CustomTextWidget(
                                  text: '$quantity',
                                  fontWeight: FontWeight.bold,
                                );
                              },
                            ),
                            SizedBox(width: 12),
                            Consumer(
                              builder: (context, ref, _) {
                                final isTapped = ref.watch(applyButtonNotifier);
                                return AnimatedScale(
                                  duration: Duration(milliseconds: 100),
                                  scale: isTapped ? 0.90 : 1,
                                  child: CustomElevatedButton(
                                    onTapUp:
                                        (_) =>
                                            ref
                                                .read(
                                                  applyButtonNotifier.notifier,
                                                )
                                                .state = false,
                                    onTapDown:
                                        (_) =>
                                            ref
                                                .read(
                                                  applyButtonNotifier.notifier,
                                                )
                                                .state = true,
                                    onPressed: () {
                                      final currentQuantity = ref.read(
                                        itemQuantityNotifier.notifier,
                                      );
                                      currentQuantity.state++;
                                      final basePrice = 500.0;
                                      ref
                                          .read(
                                            selectedItemPricenotifier.notifier,
                                          )
                                          .state = basePrice *
                                          ref.read(itemQuantityNotifier);
                                    },
                                    color: colorScheme.primary.withAlpha(60),
                                    borderWidth: 0,
                                    height: 40,
                                    width: 40,
                                    borderRadius: 20,
                                    child: CustomTextWidget(
                                      text: '+',
                                      color: colorScheme.primary,
                                      fontWeight: FontWeight.bold,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Consumer(
                      builder: (context, ref, _) {
                        final isTapped = ref.watch(googleButtonTappedNotifier);
                        final itemPrice = ref.watch(selectedItemPricenotifier);
                        return AnimatedScale(
                          duration: Duration(milliseconds: 100),
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
                            onPressed:
                                () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CheckoutScreen(),
                                  ),
                                ),
                            color: colorScheme.primary,
                            borderWidth: 0,
                            height: 40,
                            borderRadius: 20,
                            child: CustomTextWidget(
                              text: 'Add to cart - PKR: $itemPrice',
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
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
