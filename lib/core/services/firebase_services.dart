import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpodpractice/core/model/category_model.dart';
import 'package:riverpodpractice/core/model/item_model.dart';
import 'package:riverpodpractice/core/model/user_model.dart';
import 'package:riverpodpractice/core/toast.dart';
import 'package:riverpodpractice/main.dart';
import 'package:riverpodpractice/core/services/auth_notifier.dart';
import 'package:toastification/toastification.dart';

class FirebaseServices {
  static final FirebaseAuth auth = FirebaseAuth.instance;
  static final categoryRef = FirebaseFirestore.instance.collection('Category');
  static final itemsRef = FirebaseFirestore.instance.collection('Items');
  static final offersRef = FirebaseFirestore.instance.collection('Offers');
  static final cartRef = FirebaseFirestore.instance.collection('Cart');
  static final GoogleSignIn googleSignIn = GoogleSignIn.instance;
  static UserModel? userData;
  static bool isInitialize = false;

  static Future<void> initSignIn() async {
    if (!isInitialize) {
      await googleSignIn.initialize(
        serverClientId:
            '694196710386-64dvkaddqlbq98uq2u2ctthqbnnlgr50.apps.googleusercontent.com',
      );
    }
    isInitialize = true;
  }

  static Future<void> createUser(
    UserModel user,
    BuildContext context,
    WidgetRef ref,
  ) async {
    try {
      UserCredential response = await auth.createUserWithEmailAndPassword(
        email: user.email,
        password: passwordController.text,
      );
      resetFields();
      User? isUser = response.user;
      if (isUser != null) {
        await userRef.doc(isUser.uid).set(user.toJson());
        Toast.showToast(
          context,
          'User Created',
          'The user with this credentials created successfully!',
          ToastificationType.success,
        );
      }
      resetFields();
      ref.read(verifyingNotifier.notifier).state = false;
      Navigator.pop(context);
      Navigator.pop(context);
      signinFormKey.currentState?.reset();
    } catch (e, st) {
      ref.read(verifyingNotifier.notifier).state = false;
      log(
        'Error in creating new user (Auth Notifier) :: $e,\nStack Trace::$st',
      );
    }
  }

  static Future<void> signinUser(WidgetRef ref, BuildContext context) async {
    try {
      // ref.read(verifyingNotifier.notifier).state = true;
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text,
      );
      User? user = userCredential.user;

      if (user != null) {
        await fetchUser();
        sharedPref?.setBool('islogin', true);
        ref.read(verifyingNotifier.notifier).state = false;
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (context) => HomeScreen()),
        // );
      }
    } on FirebaseAuthException catch (e) {
      // ref.read(verifyingNotifier.notifier).state = false;
      log('FirebaseAuthException: ${e.code}, Message: ${e.message}');
    } catch (e, st) {
      // ref.read(verifyingNotifier.notifier).state = false;
      log(
        'Error while user signin to their account:: error:$e, stack trace:$st',
      );
    }
  }

  static Future<void> fetchUser() async {
    try {
      final userDoc = await userRef.doc(auth.currentUser!.uid).get();
      userData = UserModel.fromMap(userDoc.data()!, auth.currentUser!.uid);
    } catch (e, st) {
      log('Error while fetching user data :: error:$e, stack trace:$st');
    }
  }

  static Future<UserCredential?> signInWithGoogle() async {
    try {
      initSignIn();
      final GoogleSignInAccount googleUser = await googleSignIn.authenticate();
      final idToken = googleUser.authentication.idToken;
      final authorizationClient = googleUser.authorizationClient;
      GoogleSignInClientAuthorization? authorization = await authorizationClient
          .authorizationForScopes(['email', 'profile']);
      final accessToken = authorization?.accessToken;
      if (accessToken == null) {
        final authorization2 = await authorizationClient.authorizationForScopes(
          ['email', 'profile'],
        );
        if (authorization2?.accessToken == null) {
          throw FirebaseAuthException(code: "error", message: "error");
        }
        authorization = authorization2;
      }
      final credential = GoogleAuthProvider.credential(
        accessToken: accessToken,
        idToken: idToken,
      );
      log('Access Token: ${credential.accessToken}');
      log('Id Token: ${credential.idToken}');
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(credential);

      return userCredential;
    } catch (e) {
      log('Error: $e');
      rethrow;
    }
  }

  static Future<void> signOut() async {
    await googleSignIn.signOut();
    await auth.signOut();
  }

  static Stream<List<CategoryModel>> fetchCategories() {
    try {
      return categoryRef.snapshots().map((categorySnap) {
        List<CategoryModel> categories = [];
        for (var categoryDoc in categorySnap.docs) {
          final category = categoryDoc.data();
          categories.add(CategoryModel.fromMap(category, categoryDoc.id));
        }
        return categories;
      });
    } catch (e, st) {
      log('Error while fetching categories => Error: $e, Stack trace: $st');
      return Stream.empty();
    }
  }

  Stream<List<ItemModel>> fetchItems() {
    try {
      return itemsRef.snapshots().map((snapshot) {
        List<ItemModel> items = [];
        for (var itemDoc in snapshot.docs) {
          final itemData = itemDoc.data();
          items.add(ItemModel.fromMap(itemData, itemDoc.id));
        }
        return items;
      });
    } catch (e, st) {
      log('Error while fetching items => Error: $e, Stack trace: $st');
      return Stream.empty();
    }
  }
}
