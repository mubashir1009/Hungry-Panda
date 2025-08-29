import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodpractice/core/services/home_notifier.dart';
import 'package:riverpodpractice/widgets/custom_animated_container.dart';
import 'package:riverpodpractice/widgets/custom_text_widget.dart';

class PaymentWidgets extends StatelessWidget {
  final String title;
  final IconData icon;
  const PaymentWidgets({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return CustomAnimatedContainer(
      horPadding: 10,
      verPadding: 5,
      verMargin: 8,
      horMargin: 10,
      height: 80,
      color: Colors.grey.shade400.withAlpha(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: Theme.of(context).colorScheme.primary),
              SizedBox(width: 8),
              CustomTextWidget(text: title, fontWeight: FontWeight.bold),
            ],
          ),
          Consumer(
            builder: (context, ref, _) {
              final isSelected = ref.watch(selectedPaymentMethodNotifier);
              return Radio(
                value: title,
                groupValue: isSelected,
                onChanged: (_) {
                  ref.read(selectedPaymentMethodNotifier.notifier).state =
                      title;
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
