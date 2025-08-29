import 'package:flutter/material.dart';
import 'package:riverpodpractice/main.dart';
import 'package:riverpodpractice/presentation/home/home_screen.dart';
import 'package:riverpodpractice/presentation/onboarding/splash_screen.dart';

class InitChecks {
  static Widget initialChecks() {
    if (sharedPref!.getBool('isLogin')??false) {
      return HomeScreen();
    } else {
      return SplashScreen();
    }
  }
}
