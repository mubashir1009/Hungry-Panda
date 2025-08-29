import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodpractice/core/constants/app_text.dart';
import 'package:riverpodpractice/core/constants/assets.dart';
import 'package:riverpodpractice/presentation/home/search/filter_select_sheet.dart';
import 'package:riverpodpractice/widgets/custom_animated_container.dart';
import 'package:riverpodpractice/widgets/custom_svg_widget.dart';
import 'package:riverpodpractice/widgets/custom_text_widget.dart';

class CategoryChip extends StatelessWidget {
  final String imagePath;
  final String categoryName;
  final bool isSelected;
  final bool? isSvg;
  final Color? imageColor;
  final double? width;
  const CategoryChip({
    super.key,
    required this.imagePath,
    required this.categoryName,
    required this.isSelected,
    this.isSvg,
    this.imageColor,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        // final isSelected = ref.watch(recommendedCategoryChipsNotifier);
        return CustomAnimatedContainer(
          borderRadius: 20,
          height: 34,
          width: width,
          color:
              isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Colors.transparent,
          borderColor: Theme.of(context).colorScheme.primary,
          borderWidth: 2,
          onTap: () {
            if (categoryName == filterText) {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                isDismissible: true,
                builder: (context) {
                  return DraggableScrollableSheet(
                    expand: false,
                    initialChildSize: 0.9,
                    minChildSize: 0.2,
                    maxChildSize: 0.9,
                    builder: (context, scrollController) {
                      return CustomAnimatedContainer(
                        borderRadius: 20,
                        color: Theme.of(context).colorScheme.surface,
                        child: const FilterSelectSheet(),
                      );
                    },
                  );
                },
              );
            }
            // setCategoryChipsState(isSelected, index, ref);
          },
          topBorder: true,
          bottomBorder: true,
          rightBorder: true,
          leftBorder: true,
          horPadding: 10,
          verPadding: 6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isSvg ?? false
                  ? SvgWidget(
                    image: imagePath,
                    isColor: true,
                    height: 12,
                    width: 12,
                    color: imageColor ?? Theme.of(context).colorScheme.primary,
                  )
                  : imagePath.isEmpty
                  ? Image.asset(hamburger)
                  : Image.network(imagePath),
              SizedBox(width: 8),
              CustomTextWidget(
                text: categoryName,
                fontSize: 14,
                color:
                    isSelected
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
        );
      },
    );
  }
}
