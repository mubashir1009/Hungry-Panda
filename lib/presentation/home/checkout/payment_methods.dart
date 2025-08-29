import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodpractice/core/services/walkthrough_notifier.dart';
import 'package:riverpodpractice/presentation/home/checkout/payment_widgets.dart';
import 'package:riverpodpractice/presentation/home/widgets/back_to.dart';
import 'package:riverpodpractice/widgets/custom_elevated_button.dart';
import 'package:riverpodpractice/widgets/custom_text_widget.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.,
            children: [
              BackTo(title: 'Payment Methods'),
              SizedBox(height: 16),
              PaymentWidgets(title: 'Cash on delivery', icon: Icons.payments),
              PaymentWidgets(
                title: 'My Wallet',
                icon: Icons.account_balance_wallet,
              ),
              PaymentWidgets(title: 'JassCash', icon: Icons.phone_iphone),
              PaymentWidgets(title: 'Sadapay', icon: Icons.credit_card),
              PaymentWidgets(title: 'EasyPaisa', icon: Icons.mobile_friendly),
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
                                  .read(googleButtonTappedNotifier.notifier)
                                  .state = false,
                      onTapDown:
                          (_) =>
                              ref
                                  .read(googleButtonTappedNotifier.notifier)
                                  .state = true,
                      onPressed: () => Navigator.pop(context),
                      color: colorScheme.primary,
                      borderWidth: 0,
                      height: 50,
                      borderRadius: 20,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: CustomTextWidget(
                        text: 'Apply',
                        color: colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
