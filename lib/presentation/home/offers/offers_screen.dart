import 'package:flutter/material.dart';
import 'package:riverpodpractice/core/constants/app_text.dart';
import 'package:riverpodpractice/core/constants/assets.dart';
import 'package:riverpodpractice/presentation/home/widgets/back_to.dart';
import 'package:riverpodpractice/widgets/custom_animated_container.dart';

class OffersScreen extends StatelessWidget {
  final List<String> imgList = [offer1, offer2, offer3,offer1, offer2, offer3];
  OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            BackTo(title: specialOffers),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(top: 16, left: 10, right: 10),
                child: Column(
                  children:
                      imgList.map((url) {
                        return CustomAnimatedContainer(
                          isImage: true,
                          imagePath: url,
                          verMargin: 5,
                          color: Colors.transparent,
                          height: 150,
                          borderRadius: 20,
                        );
                      }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
