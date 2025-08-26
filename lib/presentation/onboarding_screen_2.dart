import 'package:flutter/material.dart';
import 'package:riverpodpractice/core/constants/app_text.dart';
import 'package:riverpodpractice/core/constants/assets.dart';
import 'package:riverpodpractice/main.dart';
import 'package:riverpodpractice/presentation/home_screen.dart';
import 'package:riverpodpractice/widgets/custom_animated_container.dart';
import 'package:riverpodpractice/widgets/custom_elevated_button.dart';
import 'package:riverpodpractice/widgets/custom_svg_widget.dart';
import 'package:riverpodpractice/widgets/custom_text_widget.dart';
import 'package:riverpodpractice/widgets/custom_textfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen2 extends StatelessWidget {
  final controller = TextEditingController();
  OnboardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: colorScheme.secondary,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            CustomAnimatedContainer(
              height: MediaQuery.of(context).size.height * 0.6,
              bottomLeftRadius: 10,
              bottomRightRadius: 10,
              horPadding: 40,
              color: colorScheme.primary,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(bucket3),
                    SizedBox(height: 4),
                    SvgWidget(
                      image: bucketShadow,
                      color: Color.fromARGB(255, 240, 134, 38),
                      isColor: true,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextWidget(
                    text: enterFirstNameText,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 10),
                  CustomTextField(
                    controller: controller,
                    radius: 8,
                    onSubmitted: (val) async {
                      sharedPref ??= await SharedPreferences.getInstance();
                      sharedPref!.setString('name', val);
                      Navigator.pushReplacement(
                        // ignore: use_build_context_synchronously
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    fillColor: Colors.grey.shade400.withAlpha(60),
                    hint: enterFirstNameText,
                    labelColor: Colors.grey,
                    hintColor: Colors.grey,
                    borderColor: colorScheme.onPrimary,
                    focusedBorderColor: colorScheme.onPrimary,
                    borderWidth: 1,
                  ),
                  SizedBox(height: 20),
                  CustomElevatedButton(
                    onPressed: () async {
                      sharedPref ??= await SharedPreferences.getInstance();
                      sharedPref!.setString('name', controller.text);
                      Navigator.pushReplacement(
                        // ignore: use_build_context_synchronously
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    child: CustomTextWidget(text: getStartedText),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
