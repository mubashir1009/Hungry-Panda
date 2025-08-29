import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodpractice/core/constants/app_text.dart';
import 'package:riverpodpractice/core/constants/assets.dart';
import 'package:riverpodpractice/core/services/home_notifier.dart';
import 'package:riverpodpractice/presentation/home/widgets/back_to.dart';
import 'package:riverpodpractice/widgets/custom_animated_container.dart';
import 'package:riverpodpractice/widgets/custom_text_widget.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 12,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackTo(title:moreCategory),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 13,right: 13),
                child: Consumer(
                  builder: (context, ref, _) {
                    final categorySnap = ref.watch(
                      recommendedCategoryChipsNotifier,
                    );
                    return categorySnap.when(
                      data: (snapshots) {
                        return GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: snapshots.length,
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
                                  snapshots[index].imagePath.isEmpty
                                      ? Image.asset(sweet, height: 40)
                                      : Image.network(
                                        snapshots[index].imagePath,
                                        height: 40,
                                      ),
                                  const SizedBox(height: 4),
                                  CustomTextWidget(
                                    text: snapshots[index].name,
                                    fontSize: 12,
                                  ),
                                ],
                              ),
                            );
                          },
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
