import 'package:flutter/material.dart';
import 'package:riverpodpractice/presentation/home/restaurant/rating_with_review.dart';
import 'package:riverpodpractice/presentation/home/restaurant/user_review.dart';
import 'package:riverpodpractice/presentation/home/widgets/back_to.dart';
import 'package:riverpodpractice/widgets/custom_text_widget.dart';

class RestaurantRating extends StatelessWidget {
  const RestaurantRating({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackTo(title: 'Rating & Reviews', iconColor: colorScheme.onSurface),
            SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(color: Colors.grey.shade400),
                    SizedBox(height: 8),
                    RatingWithReview(),
                    SizedBox(height: 8),
                    Divider(color: Colors.grey.shade400),
                    SizedBox(height: 10),
                    CustomTextWidget(
                      text: 'Reviews',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 10),
                    UserReview(),
                    UserReview(),
                    UserReview(),
                    UserReview(),
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
