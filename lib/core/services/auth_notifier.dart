import 'dart:async';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final TextEditingController contactController = TextEditingController();
final TextEditingController countryCode = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController confirmPasswordController = TextEditingController();
final TextEditingController nameController = TextEditingController();
final TextEditingController pinController = TextEditingController();

final GlobalKey<FormState> signinFormKey = GlobalKey<FormState>();
final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

final userRef = FirebaseFirestore.instance.collection('Users');
int count = 60;

void resetFields() {
  contactController.text = '';
  emailController.text = '';
  nameController.text = '';
  passwordController.text = '';
  confirmPasswordController.text = '';
}

final counterNotifier = StateProvider<int>((ref) => 60);

void oneMinuteTimer(WidgetRef ref) {
  Timer.periodic(const Duration(seconds: 1), (timer) {
    final current = ref.read(counterNotifier);

    if (current > 0) {
      ref.read(counterNotifier.notifier).state = current - 1;
    } else {
      timer.cancel();
    }
  });
}

void sendOTP() {
  FirebaseAuth auth = FirebaseAuth.instance;

  auth.verifyPhoneNumber(
    phoneNumber: countryCode.text + contactController.text,
    timeout: const Duration(seconds: 60),

    verificationCompleted: (PhoneAuthCredential credential) async {
      await auth.signInWithCredential(credential);
      log("Phone verified automatically!");
    },

    verificationFailed: (FirebaseAuthException e) {
      log("Verification failed: ${e.message}");
    },

    codeSent: (String verificationId, int? resendToken) {
      // Save verificationId to use later in OTP verification
      log("OTP sent! Verification ID: $verificationId");
    },

    codeAutoRetrievalTimeout: (String verificationId) {
      // Called when auto-retrieval times out
      log("Timeout! Verification ID: $verificationId");
    },
  );
}

final checkBoxNotifier = StateProvider<bool>((ref) {
  return false;
});

final passwordNotifier = StateProvider<bool>((ref) {
  return false;
});

final confirmPasswordNotifier = StateProvider<bool>((ref) {
  return false;
});

final verifyingNotifier = StateProvider<bool>((ref) {
  return false;
});


