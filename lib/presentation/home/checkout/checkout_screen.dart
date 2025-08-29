import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodpractice/core/constants/assets.dart';
import 'package:riverpodpractice/core/services/walkthrough_notifier.dart';
import 'package:riverpodpractice/presentation/home/checkout/payment_methods.dart';
import 'package:riverpodpractice/presentation/home/order/ordered_item_screen.dart';
import 'package:riverpodpractice/presentation/home/widgets/back_to.dart';
import 'package:riverpodpractice/widgets/custom_animated_container.dart';
import 'package:riverpodpractice/widgets/custom_elevated_button.dart';
import 'package:riverpodpractice/widgets/custom_text_widget.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              BackTo(title: 'Checkout Orders'),
              CustomAnimatedContainer(
                verMargin: 8,
                horMargin: 8,
                horPadding: 10,
                verPadding: 10,
                color: Colors.grey.shade400.withAlpha(40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: 'Deliver to',
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 5),
                    Divider(color: Colors.grey.shade400),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Material(
                        type: MaterialType.transparency,
                        child: ListTile(
                          leading: CustomAnimatedContainer(
                            color: colorScheme.primary.withAlpha(60),
                            borderRadius: 26,
                            height: 46,
                            width: 46,
                            child: CustomAnimatedContainer(
                              color: colorScheme.primary,
                              borderRadius: 20,
                              height: 34,
                              width: 34,
                              child: Icon(
                                Icons.location_on,
                                color: colorScheme.onPrimary,
                                size: 24,
                              ),
                            ),
                          ),
                          title: CustomTextWidget(
                            text: 'Home',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          subtitle: CustomTextWidget(
                            text: 'Gulshan-Iqbal, Al Reman Street',
                            fontSize: 12,
                            color: Colors.grey.shade400,
                          ),
                          trailing: Icon(Icons.arrow_forward_ios_rounded),
                          onTap: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              CustomAnimatedContainer(
                horPadding: 10,
                verPadding: 10,
                horMargin: 10,
                verMargin: 5,
                color: Colors.grey.shade400.withAlpha(20),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox(
                        height: 76,
                        width: 76,
                        child: Image.asset(offer1, fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                            text: 'Wings Bucket 8 Piece',
                            fontWeight: FontWeight.bold,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomTextWidget(
                                text: 'PKR: 600',
                                color: colorScheme.primary,
                              ),
                              CustomAnimatedContainer(
                                height: 40,
                                width: 100,
                                color: Colors.transparent,
                                borderRadius: 20,
                                horPadding: 8,
                                verPadding: 5,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Icon(
                                        Icons.delete,
                                        size: 18,
                                        color: colorScheme.onSurface,
                                      ),
                                    ),
                                    CustomTextWidget(text: '1'),
                                    CustomElevatedButton(
                                      onPressed: () {},
                                      color: colorScheme.primary.withAlpha(60),
                                      borderWidth: 0,
                                      height: 30,
                                      width: 30,
                                      borderRadius: 20,
                                      child: CustomTextWidget(
                                        text: '+',
                                        color: colorScheme.primary,
                                        fontWeight: FontWeight.bold,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              CustomAnimatedContainer(
                horPadding: 10,
                verPadding: 10,
                horMargin: 10,
                verMargin: 5,
                color: Colors.grey.shade400.withAlpha(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: 'Selected Method',
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Material(
                        type: MaterialType.transparency,
                        child: ListTile(
                          leading: Icon(
                            Icons.delivery_dining_rounded,
                            color: colorScheme.primary,
                          ),
                          title: CustomTextWidget(
                            text: 'Cash on delivery',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          subtitle: CustomTextWidget(
                            text: 'Pay when order recieve',
                            fontSize: 12,
                            color: Colors.grey.shade400,
                          ),
                          onTap: () {},
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Divider(color: Colors.grey.shade400),
                    SizedBox(height: 5),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Material(
                        type: MaterialType.transparency,
                        child: ListTile(
                          leading: Icon(
                            Icons.wallet,
                            color: colorScheme.primary,
                          ),
                          title: CustomTextWidget(
                            text: 'Payment Methods',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          trailing: Icon(Icons.arrow_forward_ios_rounded),
                          onTap:
                              () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PaymentMethods(),
                                ),
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              CustomAnimatedContainer(
                horPadding: 10,
                verPadding: 10,
                horMargin: 10,
                verMargin: 5,
                color: Colors.grey.shade400.withAlpha(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextWidget(
                          text: 'Subtotal',
                          color: Colors.grey.shade400,
                        ),
                        CustomTextWidget(
                          text: 'PKR: 1200',
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextWidget(
                          text: 'Delivery Fee',
                          color: Colors.grey.shade400,
                        ),
                        CustomTextWidget(
                          text: 'PKR: 60',
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Divider(color: Colors.grey.shade400),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextWidget(
                          text: 'Total',
                          color: Colors.grey.shade400,
                        ),
                        CustomTextWidget(text: 'PKR: 1260'),
                      ],
                    ),
                    SizedBox(height: 20),
                    Consumer(
                      builder: (context, ref, _) {
                        final isTapped = ref.watch(googleButtonTappedNotifier);
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
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OrderedItemScreen(),
                                ),
                              );
                            },
                            color: colorScheme.primary,
                            borderWidth: 0,
                            height: 40,
                            borderRadius: 20,
                            child: CustomTextWidget(
                              text: 'Place Order - PKR: 1260',
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
            ],
          ),
        ),
      ),
    );
  }
}
