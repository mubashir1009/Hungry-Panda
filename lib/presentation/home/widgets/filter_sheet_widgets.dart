import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodpractice/presentation/home/widgets/custom_filter_item.dart';
import 'package:riverpodpractice/widgets/custom_animated_container.dart';
import 'package:riverpodpractice/widgets/custom_text_widget.dart';

class FilterSheetWidgets extends ConsumerWidget {
  final String title;
  final List<String> items;
  const FilterSheetWidgets({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomAnimatedContainer(
      color: Colors.grey.shade400.withAlpha(20),
      borderRadius: 10,
      verPadding: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 5.0),
            child: CustomTextWidget(
              text: title,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 5),
          Divider(color: Colors.grey.shade400.withAlpha(40)),
          SizedBox(height: 5),
          ...items.map((item) {
            return CustomFilterItem(title: item, category: title);
          }),
        ],
      ),
    );
  }
}
