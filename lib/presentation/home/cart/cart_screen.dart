import 'package:flutter/material.dart';
import 'package:riverpodpractice/core/constants/app_text.dart';
import 'package:riverpodpractice/core/constants/assets.dart';
import 'package:riverpodpractice/presentation/home/widgets/back_to.dart';
import 'package:riverpodpractice/presentation/home/widgets/item_card_small.dart';

class CartScreen extends StatelessWidget {
  final List<String> imgList = [offer2, offer3, offer2, offer3, offer2, offer3];
  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            BackTo(title: cart),
            // Expanded(
            //   child: Padding(
            //     padding: EdgeInsets.only(top: 16, left: 10, right: 10),
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Image.asset(emptyCart),
            //         CustomTextWidget(text: empty, fontWeight: FontWeight.bold, fontSize: 18,),
            //         CustomTextWidget(text: emptySubtitle2, fontSize: 14,),
            //       ]),
            //   ),
            // ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(top: 16, left: 10, right: 10),
                child: Column(
                  children:
                      imgList.map((path) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: ItemCardSmall(
                            imagePath: path,
                            isSlidable: true,
                          ),
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
