import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodpractice/core/constants/app_text.dart';
import 'package:riverpodpractice/core/services/home_notifier.dart';
import 'package:riverpodpractice/widgets/custom_checkbox.dart';
import 'package:riverpodpractice/widgets/custom_text_widget.dart';

class CustomFilterItem extends StatelessWidget {
  final String title;
  final String category;
  const CustomFilterItem({
    super.key,
    required this.title,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        category != cuisinessText
            ? Consumer(
              builder: (context, ref, _) {
                final isSelected =
                    category == sortByText
                        ? ref.watch(selectedSortFilterNotifier)
                        : category == resataurantText
                        ? ref.watch(selectedRestaurantFilterNotifier)
                        : ref.watch(selectedModeFilterNotifier);
                return Radio<String>(
                  value: title,
                  groupValue: isSelected,
                  onChanged: (_) {
                    if (category == sortByText) {
                      ref.read(selectedSortFilterNotifier.notifier).state =
                          title;
                    } else if (category == resataurantText) {
                      ref
                          .read(selectedRestaurantFilterNotifier.notifier)
                          .state = title;
                    } else {
                      ref.read(selectedModeFilterNotifier.notifier).state =
                          title;
                    }
                  },
                  visualDensity: const VisualDensity(
                    horizontal: -2,
                    vertical: -2,
                  ),
                );
              },
            )
            : Consumer(
              builder: (context, ref, _) {
                final isSelected = ref.watch(selectedCuisineFiltersNotifier);
                return CustomCheckbox(
                  value: isSelected.contains(title),
                  onChanged: (value) {
                    final notifier = ref.read(
                      selectedCuisineFiltersNotifier.notifier,
                    );

                    if (value == true) {
                      notifier.state = [...notifier.state, title]; 
                    } else {
                      notifier.state =
                          notifier.state
                              .where((item) => item != title)
                              .toList();
                    }
                  },
                );
              },
            ),
        CustomTextWidget(text: title, fontWeight: FontWeight.bold),
      ],
    );
  }
}
