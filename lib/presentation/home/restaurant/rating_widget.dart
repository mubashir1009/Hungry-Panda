import 'package:flutter/material.dart';
import 'package:riverpodpractice/widgets/custom_text_widget.dart';

class RatingWidget extends StatelessWidget {
  final String label;
  final double value;
  const RatingWidget({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          CustomTextWidget(text: label),
          const SizedBox(width: 8),
          Expanded(
            child: LinearProgressIndicator(
              value: value,
              minHeight: 8,
              color: colorScheme.primary,
              backgroundColor: Colors.grey.shade300,
            ),
          ),
        ],
      ),
    );
  }
}