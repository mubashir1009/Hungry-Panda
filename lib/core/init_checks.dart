import 'package:flutter/material.dart';
import 'package:riverpodpractice/main.dart';
import 'package:riverpodpractice/presentation/home_screen.dart';
import 'package:riverpodpractice/presentation/onboarding/splash_screen.dart';

class InitChecks {
  static Widget initialChecks() {
    if (sharedPref!.containsKey('name')) {
      return HomeScreen();
    } else {
      return SplashScreen();
    }
  }
}
