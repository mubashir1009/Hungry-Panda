import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodpractice/core/constants/app_text.dart';
import 'package:riverpodpractice/core/constants/assets.dart';
import 'package:riverpodpractice/core/services/home_notifier.dart';
import 'package:riverpodpractice/presentation/home/widgets/category_chip.dart';
import 'package:riverpodpractice/presentation/home/widgets/item_card_small.dart';
import 'package:riverpodpractice/widgets/custom_textfield.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 8, top: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back, color: colorScheme.primary),
                  ),
                  Expanded(
                    child: Hero(
                      tag: 'searchField',
                      child: Material(
                        child: CustomTextField(
                          controller: searchController,
                          radius: 8,
                          autoFocus: true,
                          fillColor: Colors.grey.shade400.withAlpha(60),
                          hint: searchItems,
                          labelColor: Colors.grey,
                          onChanged: (val) {
                            // ref.read(searchProvider.notifier).state = val;
                          },
                          hintColor: Colors.grey,
                          borderColor: colorScheme.onPrimary,
                          focusedBorderColor: colorScheme.onPrimary,
                          borderWidth: 1,
                          preffixIcon: Icon(Icons.search, color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: CategoryChip(
                            imagePath: filter,
                            isSvg: true,
                            width: 100,
                            categoryName: filterText,
                            imageColor: colorScheme.primary,
                            isSelected: false,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: imgList.map((path) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: ItemCardSmall(imagePath: path),
                              );
                            }).toList(),
                    // [
                    //   CustomAnimatedContainer(
                    //     height: 400,
                    //     alignment: Alignment.center,
                    //     width: MediaQuery.of(context).size.width * 0.8,
                    //     color: colorScheme.surface,
                    //     child: Column(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       children: [
                    //         Image.asset(emptyItem),
                    //         CustomTextWidget(
                    //           text: 'Not Found',
                    //           fontWeight: FontWeight.bold,
                    //           textAlign: TextAlign.center,
                    //         ),
                    //         CustomTextWidget(
                    //           text:
                    //               'Sorry, the keword you entered cannot be found. search again, with different keyword',
                    //           overflow: TextOverflow.clip,
                    //           textAlign: TextAlign.center,
                    //           fontSize: 14,
                    //           color: Colors.grey,
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
