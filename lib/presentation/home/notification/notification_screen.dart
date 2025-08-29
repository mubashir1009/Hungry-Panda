import 'package:flutter/material.dart';
import 'package:riverpodpractice/core/constants/app_text.dart';
import 'package:riverpodpractice/presentation/home/widgets/back_to.dart';
import 'package:riverpodpractice/widgets/custom_text_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            BackTo(title: notification),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 16, left: 10, right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextWidget(text: empty, fontWeight: FontWeight.bold, fontSize: 18,),
                    CustomTextWidget(text: emptySubtitle, fontSize: 14,),
                  ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
