import 'package:flutter/material.dart';
import 'package:riverpodpractice/core/constants/assets.dart';
import 'package:riverpodpractice/presentation/home/restaurant/rating_with_review.dart';
import 'package:riverpodpractice/presentation/home/widgets/back_to.dart';
import 'package:riverpodpractice/widgets/custom_animated_container.dart';
import 'package:riverpodpractice/widgets/custom_text_widget.dart';

class RestaurantAbout extends StatelessWidget {
  const RestaurantAbout({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackTo(title: '', iconColor: colorScheme.onSurface),
              Padding(
                padding: const EdgeInsets.only(
                  top: 5.0,
                  left: 14.0,
                  right: 10.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: 'KababJees',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 5),
                    Divider(color: Colors.grey.shade400),
                    SizedBox(height: 5),
                    RatingWithReview(),
                    SizedBox(height: 5),
                    Divider(color: Colors.grey.shade400),
                    SizedBox(height: 10),
                    CustomTextWidget(
                      text: 'Overview',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 5),
                    CustomTextWidget(
                      text:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.',
                      color: Colors.grey.shade400,
                      overflow: TextOverflow.clip,
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextWidget(
                          text: 'Monday-Friday',
                          fontWeight: FontWeight.bold,
                        ),
                        CustomTextWidget(
                          text: ':  10:00 - 22:00',
                          color: colorScheme.primary,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.clip,
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextWidget(
                          text: 'Saturday - Sunday',
                          fontWeight: FontWeight.bold,
                        ),
                        CustomTextWidget(
                          text: ':  12:00 - 20:00',
                          color: colorScheme.primary,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.clip,
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    CustomTextWidget(
                      text: 'Address',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.clip,
                    ),
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: colorScheme.primary,),
                        SizedBox(width: 5,),
                        Expanded(
                          child: CustomTextWidget(
                            text: 'Grand City St. 100, New york, united States',
                            color: Colors.grey.shade400,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    CustomAnimatedContainer(
                      borderRadius: 10,
                      isImage: true,
                      imagePath: mapImage,
                      height: 200,
                    ),
                    SizedBox(height: 20,),
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
