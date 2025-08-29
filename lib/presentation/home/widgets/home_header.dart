import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodpractice/core/constants/app_text.dart';
import 'package:riverpodpractice/core/constants/assets.dart' as assets;
import 'package:riverpodpractice/core/services/home_notifier.dart';
import 'package:riverpodpractice/presentation/home/cart/cart_screen.dart';
import 'package:riverpodpractice/presentation/home/notification/notification_screen.dart';
import 'package:riverpodpractice/presentation/home/search/filter_screen.dart';
import 'package:riverpodpractice/widgets/custom_svg_widget.dart';
import 'package:riverpodpractice/widgets/custom_text_widget.dart';
import 'package:riverpodpractice/widgets/custom_textfield.dart';

class HomeHeader extends ConsumerWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipOval(
                    child: Image.asset(
                      assets.demoProfilePic,
                      height: 36,
                      width: 36,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 8),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextWidget(
                        text: 'Hungry Panda',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomTextWidget(
                            text: 'Gulshan iqbal, rahim yar khan',
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                          Icon(
                            Icons.arrow_drop_down_rounded,
                            color: colorScheme.primary,
                            size: 30,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  InkWell(
                    onTap:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NotificationScreen(),
                          ),
                        ),
                    child: SvgWidget(image: assets.notification, color: colorScheme.onSurface,),
                  ),
                  SizedBox(width: 8),
                  InkWell(
                    onTap:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CartScreen()),
                        ),
                    child: SvgWidget(image: assets.shoppingCart),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Hero(
            tag: 'searchField',
            child: Material(
              child: CustomTextField(
                controller: searchController,
                radius: 8,
                fillColor: Colors.grey.shade400.withAlpha(60),
                hint: searchItems,
                labelColor: Colors.grey,
                onChanged: (val) {
                  // ref.read(searchProvider.notifier).state = val;
                },
                onTap:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FilterScreen()),
                    ),
                hintColor: Colors.grey,
                borderColor: colorScheme.onPrimary,
                focusedBorderColor: colorScheme.onPrimary,
                borderWidth: 1,
                preffixIcon: Icon(Icons.search, color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
