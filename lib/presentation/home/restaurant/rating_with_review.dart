import 'package:flutter/material.dart';
import 'package:riverpodpractice/presentation/home/restaurant/rating_widget.dart';
import 'package:riverpodpractice/widgets/custom_animated_container.dart';
import 'package:riverpodpractice/widgets/custom_text_widget.dart';

class RatingWithReview extends StatelessWidget {
  const RatingWithReview({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAnimatedContainer(
      color: Colors.transparent,
      horPadding: 10,
      verPadding: 10,
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                CustomTextWidget(
                  text: '4.8',
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 22),
                    Icon(Icons.star, color: Colors.amber, size: 22),
                    Icon(Icons.star, color: Colors.amber, size: 22),
                    Icon(Icons.star, color: Colors.amber, size: 22),
                    Icon(Icons.star, color: Colors.grey.shade400, size: 22),
                  ],
                ),
                SizedBox(height: 6),
                CustomTextWidget(
                  text: '(4.8k reviews)',
                  fontSize: 22,
                  color: Colors.grey.shade400,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RatingWidget(label: '5', value: 0.9),
                RatingWidget(label: '4', value: 0.6),
                RatingWidget(label: '3', value: 0.3),
                RatingWidget(label: '2', value: 0.4),
                RatingWidget(label: '1', value: 0.2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
