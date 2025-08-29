import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodpractice/core/constants/app_text.dart';
import 'package:riverpodpractice/core/services/home_notifier.dart';
import 'package:riverpodpractice/presentation/home/widgets/filter_sheet_widgets.dart';
import 'package:riverpodpractice/widgets/custom_animated_container.dart';
import 'package:riverpodpractice/widgets/custom_elevated_button.dart';
import 'package:riverpodpractice/widgets/custom_text_widget.dart';

class FilterSelectSheet extends StatefulWidget {
  const FilterSelectSheet({super.key});

  @override
  State<FilterSelectSheet> createState() => _FilterSelectSheetState();
}

class _FilterSelectSheetState extends State<FilterSelectSheet>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final ScrollController scrollController = ScrollController();
  final sortKey = GlobalKey();
  final restaurantKey = GlobalKey();
  final modeKey = GlobalKey();
  final cuisineKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    scrollController.addListener(onScroll);
  }

  @override
  void dispose() {
    scrollController.dispose();
    tabController.dispose();
    super.dispose();
  }

  void onScroll() {
    final sortPos = getWidgetOffset(sortKey);
    final restaurantPos = getWidgetOffset(restaurantKey);
    final modePos = getWidgetOffset(modeKey);
    final cuisinePos = getWidgetOffset(cuisineKey);

    final scrollOffset = scrollController.offset + 100; // small buffer

    if (scrollOffset >= cuisinePos) {
      tabController.animateTo(3);
    } else if (scrollOffset >= modePos) {
      tabController.animateTo(2);
    } else if (scrollOffset >= restaurantPos) {
      tabController.animateTo(1);
    } else if (scrollOffset >= sortPos) {
      tabController.animateTo(0);
    }
  }

  double getWidgetOffset(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx == null) return double.infinity;
    final box = ctx.findRenderObject() as RenderBox;
    return box.localToGlobal(Offset.zero).dy;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 0, top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.close, color: colorScheme.onSurface),
              ),
              CustomTextWidget(text: filterText, fontWeight: FontWeight.bold),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TabBar(
                controller: tabController,
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                dragStartBehavior: DragStartBehavior.down,
                labelColor: Theme.of(context).colorScheme.primary,
                labelStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                unselectedLabelColor: Colors.grey,
                unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
                dividerColor: Colors.transparent,
                indicatorPadding: const EdgeInsets.only(right: 10),
                indicatorColor: Theme.of(context).colorScheme.primary,
                tabs: const [
                  Tab(text: 'Sort by'),
                  Tab(text: 'Restaurant'),
                  Tab(text: 'Mode'),
                  Tab(text: 'Cuisines'),
                ],
              ),
            ],
          ),
          SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              controller: scrollController,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FilterSheetWidgets(
                    key: sortKey,
                    title: sortByText,
                    items: [priceText, distanceText, recommendedText],
                  ),
                  SizedBox(height: 10),
                  FilterSheetWidgets(
                    key: restaurantKey,
                    title: resataurantText,
                    items: [
                      'KababJees',
                      'Dominos',
                      'Al-Kabab',
                      'Ali Biryani',
                      'Stillers',
                      'Pizza Town',
                      'Muffins',
                      'Younus',
                    ],
                  ),
                  SizedBox(height: 10),
                  FilterSheetWidgets(
                    key: modeKey,
                    title: modeText,
                    items: [deliveryText, selfPickUpText],
                  ),
                  SizedBox(height: 10),
                  FilterSheetWidgets(
                    key: cuisineKey,
                    title: cuisinessText,
                    items: [
                      'Beverages',
                      'Vegetables',
                      'Chinese',
                      'Fast Food',
                      'Lunch',
                      'Snack',
                      'Dessert',
                      'Breakfast',
                      'Noodles',
                      'Seafood',
                      'Chicken',
                      'Japanese',
                      'Bakery & cake',
                    ],
                  ),
                ],
              ),
            ),
          ),
          CustomAnimatedContainer(
            color: Colors.transparent,
            horPadding: 10,
            verPadding: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Consumer(
                  builder: (context, ref, _) {
                    final isTapped = ref.watch(resetButtonNotifier);
                    return AnimatedScale(
                      duration: Duration(milliseconds: 300),
                      scale: isTapped ? 0.95 : 1,
                      child: CustomElevatedButton(
                        onTapUp:
                            (_) =>
                                ref.read(resetButtonNotifier.notifier).state =
                                    false,
                        onTapDown:
                            (_) =>
                                ref.read(resetButtonNotifier.notifier).state =
                                    true,
                        onPressed: () {},
                        width: MediaQuery.of(context).size.width*0.4,
                        color: colorScheme.primary.withAlpha(60),
                        borderWidth: 0,
                        borderRadius: 20,
                        child: CustomTextWidget(
                          text: resetText,
                          color: colorScheme.primary,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  },
                ),
                Consumer(
                  builder: (context, ref, _) {
                    final isTapped = ref.watch(applyButtonNotifier);
                    return AnimatedScale(
                      duration: Duration(milliseconds: 300),
                      scale: isTapped ? 0.95 : 1,
                      child: CustomElevatedButton(
                        onTapUp:
                            (_) =>
                                ref.read(applyButtonNotifier.notifier).state =
                                    false,
                        onTapDown:
                            (_) =>
                                ref.read(applyButtonNotifier.notifier).state =
                                    true,
                        onPressed: () {},
                        color: colorScheme.primary,
                        borderWidth: 0,
                        width: MediaQuery.of(context).size.width*0.4,
                        borderRadius: 20,
                        child: CustomTextWidget(
                          text: applyText,
                          color: colorScheme.onPrimary,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
