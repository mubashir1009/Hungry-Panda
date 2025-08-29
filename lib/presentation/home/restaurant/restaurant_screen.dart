import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodpractice/core/constants/app_text.dart';
import 'package:riverpodpractice/core/constants/assets.dart';
import 'package:riverpodpractice/core/services/home_notifier.dart';
import 'package:riverpodpractice/presentation/home/restaurant/restaurant_about.dart';
import 'package:riverpodpractice/presentation/home/restaurant/restaurant_offers.dart';
import 'package:riverpodpractice/presentation/home/restaurant/restaurant_rating.dart';
import 'package:riverpodpractice/presentation/home/widgets/back_to.dart';
import 'package:riverpodpractice/presentation/home/widgets/category_chip.dart';
import 'package:riverpodpractice/presentation/home/widgets/item_card_small.dart';
import 'package:riverpodpractice/widgets/custom_animated_container.dart';
import 'package:riverpodpractice/widgets/custom_svg_widget.dart';
import 'package:riverpodpractice/widgets/custom_text_widget.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key});

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
                imagePath: restaurantDummyImage,
                height: 300,
                bottomRightRadius: 10,
                bottomLeftRadius: 10,
                topLeftRadius: 0,
                topRightRadius: 0,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BackTo(title: '', iconColor: colorScheme.surface),
                        Padding(
                          padding: const EdgeInsets.only(right: 10, left: 10),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: SvgWidget(
                                  image: heart,
                                  isColor: true,
                                  color: colorScheme.surface,
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: SvgWidget(
                                  image: send,
                                  isColor: true,
                                  color: colorScheme.surface,
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
              ListTile(
                title: CustomTextWidget(
                  text: 'KababJees',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.grey.shade400,
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RestaurantAbout()),
                  ),
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber),
                    SizedBox(width: 5),
                    CustomTextWidget(text: '4.8', fontWeight: FontWeight.bold),
                    SizedBox(width: 5),
                    CustomTextWidget(
                      text: '(4.8k reviews)',
                      color: Colors.grey.shade400,
                    ),
                  ],
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.grey.shade400,
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RestaurantRating()),
                  ),
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.check, color: Colors.green),
                    SizedBox(width: 5),
                    CustomTextWidget(text: 'Offers are available'),
                  ],
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.grey.shade400,
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RestaurantOffers()),
                  ),
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(Icons.location_on, color: colorScheme.primary),
                    SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(
                          text: '2.4km',
                          fontWeight: FontWeight.bold,
                        ),
                        Row(
                          children: [
                            CustomTextWidget(
                              text: 'Delivery Now |  PKR: 50.0/-',
                              fontSize: 14,
                              color: Colors.grey.shade400,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    CustomTextWidget(
                      text: 'Menu',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Consumer(
                builder: (context, ref, _) {
                  final categories = ref.watch(
                    recommendedCategoryChipsNotifier,
                  );
                  return categories.when(
                    data: (snapshots) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children:
                              snapshots.map((category) {
                                return Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: CategoryChip(
                                    imagePath: category.imagePath,
                                    categoryName: category.name,
                                    isSelected: category.isSelected,
                                  ),
                                );
                              }).toList(),
                        ),
                      );
                    },
                    loading:
                        () => SizedBox(
                          height: 25,
                          width: 25,
                          child: CircularProgressIndicator(
                            color: colorScheme.primary,
                          ),
                        ),
                    error: (e, _) => CustomTextWidget(text: '$error: $e'),
                  );
                },
              ),
              SizedBox(height: 10),
              Column(
                children:
                    imgList.map((path) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: ItemCardSmall(imagePath: path),
                      );
                    }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
