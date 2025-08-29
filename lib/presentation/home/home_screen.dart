import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodpractice/core/constants/app_text.dart';
import 'package:riverpodpractice/core/constants/assets.dart';
import 'package:riverpodpractice/core/services/home_notifier.dart';
import 'package:riverpodpractice/presentation/home/category/categories.dart';
import 'package:riverpodpractice/presentation/home/offers/offers_screen.dart';
import 'package:riverpodpractice/presentation/home/widgets/category_chip.dart';
import 'package:riverpodpractice/presentation/home/widgets/home_header.dart';
import 'package:riverpodpractice/presentation/home/widgets/item_card.dart';
import 'package:riverpodpractice/presentation/home/widgets/item_card_small.dart';
import 'package:riverpodpractice/widgets/custom_animated_container.dart';
import 'package:riverpodpractice/widgets/custom_text_widget.dart';

class HomeScreen extends ConsumerWidget {
  final List<String> imgList = [offer2, offer3, offer2, offer3, offer2, offer3];
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      drawer: CustomAnimatedContainer(
        width: MediaQuery.of(context).size.width * 0.7,
        color: colorScheme.surface,
        isShadow: true, 
        child: Column(
          children: [
            Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    demoProfilePic,
                    height: 36,
                    width: 36,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 8),
                CustomTextWidget(text: 'Mubashir Sikander'),
              ],
            ),
            SizedBox(height: 8,),
          ],
        ),
      ),
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        backgroundColor: colorScheme.primary,

        child: Icon(Icons.receipt_long),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeHeader(),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.only(left: 10, right: 10, top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextWidget(
                          text: specialOffers,
                          fontWeight: FontWeight.bold,
                        ),
                        InkWell(
                          onTap:
                              () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OffersScreen(),
                                ),
                              ),
                          child: CustomTextWidget(
                            text: seeAll,
                            color: colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 180,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 10),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        viewportFraction: 1.0,
                      ),
                      items:
                          imgList.map((url) {
                            return CustomAnimatedContainer(
                              isImage: true,
                              imagePath: url,
                              color: Colors.transparent,
                              height: 180,
                              borderRadius: 20,
                            );
                          }).toList(),
                    ),
                    SizedBox(height: 16),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: categories.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.8,
                      ),
                      itemBuilder: (context, index) {
                        return CustomAnimatedContainer(
                          borderRadius: 10,
                          color: Colors.grey.shade400.withAlpha(60),
                          onTap: () {},
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                categories[index]["icon"]!,
                                height: 40,
                              ),
                              const SizedBox(height: 4),
                              CustomTextWidget(
                                text: categories[index]["name"]!,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextWidget(
                          text: discountGuranteed,
                          fontWeight: FontWeight.bold,
                        ),
                        InkWell(
                          onTap: () {},
                          child: CustomTextWidget(
                            text: seeAll,
                            color: colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children:
                            imgList.map((path) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: ItemCard(imagePath: path),
                              );
                            }).toList(),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextWidget(
                          text: recommendedForYou,
                          fontWeight: FontWeight.bold,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Categories(),
                              ),
                            );
                          },
                          child: CustomTextWidget(
                            text: seeAll,
                            color: colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
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
                    SingleChildScrollView(
                      child: Column(
                        children:
                            imgList.map((path) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: ItemCardSmall(imagePath: path),
                              );
                            }).toList(),
                      ),
                    ),
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
