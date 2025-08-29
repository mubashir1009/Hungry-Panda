import 'package:flutter/material.dart';
import 'package:riverpodpractice/core/constants/assets.dart';
import 'package:riverpodpractice/presentation/home/widgets/back_to.dart';
import 'package:riverpodpractice/widgets/custom_animated_container.dart';
import 'package:riverpodpractice/widgets/custom_text_widget.dart';

class OrderedItemScreen extends StatelessWidget {
  const OrderedItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 231, 253, 242),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              CustomAnimatedContainer(
                height: 120,
                isImage: true,
                imagePath: mapImage,
                color: colorScheme.primary.withAlpha(60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [BackTo(title: '', iconColor: colorScheme.primary)],
                ),
              ),
              Expanded(
                child: CustomAnimatedContainer(
                  horPadding: 10,
                  verPadding: 10,
                  topRightRadius: 80,
                  color: Colors.grey.shade400.withAlpha(40),
                  child: Column(
                    children: [
                      CustomAnimatedContainer(
                        height: 150,
                        topRightRadius: 72,
                        horPadding: 16,
                        verPadding: 10,
                        color: colorScheme.surface,
                        isShadow: true,
                        shadowColor: colorScheme.primary,
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomTextWidget(
                                    text: '20-45 Minutes',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                  CustomTextWidget(
                                    text:
                                        'Your order is preparing. Be patience, you\'re able to track your rider.',
                                    overflow: TextOverflow.clip,
                                    color: Colors.grey.shade400,
                                  ),
                                ],
                              ),
                            ),
                            CustomAnimatedContainer(
                              borderRadius: 100,
                              height: 100,
                              width: 100,
                              horPadding: 8,
                              verPadding: 8,
                              alignment: Alignment.center,
                              isShadow: true,
                              color: colorScheme.surface,
                              child: CustomAnimatedContainer(
                                height: 80,
                                width: 80,
                                horPadding: 8,
                                verPadding: 8,
                                borderRadius: 100,
                                child: Image.asset(appLogo),
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomAnimatedContainer(
                        verMargin: 10,
                        verPadding: 10,
                        horPadding: 10,
                        color: colorScheme.surface,
                        isShadow: true,
                        height: 400,
                        shadowColor: colorScheme.primary,
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextWidget(
                              text: 'Details',
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                    ],
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
