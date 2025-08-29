import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodpractice/core/constants/assets.dart';
import 'package:riverpodpractice/core/model/category_model.dart';
import 'package:riverpodpractice/core/services/firebase_services.dart';

final searchController = TextEditingController();

final List<Map<String, dynamic>> categories = [
  {'index': 0, "icon": hamburger, "name": "Burger"},
  {'index': 1, "icon": pizza, "name": "Pizza"},
  {'index': 2, "icon": noodles, "name": "Noodles"},
  {'index': 3, "icon": meat, "name": "Chicken"},
  {'index': 4, "icon": vegetables, "name": "Vegetables"},
  {'index': 5, "icon": drink, "name": "Drinks"},
  {'index': 6, "icon": biryani, "name": "Biryani"},
  {'index': 7, "icon": sweet, "name": "More"},
];
final List<String> imgList = [offer2, offer3, offer2, offer3, offer2, offer3];

final selectedSortFilterNotifier = StateProvider<String>((ref) {
  return 'Recommended';
});

final selectedRestaurantFilterNotifier = StateProvider<String>((ref) {
  return 'Kababjees';
});

final selectedModeFilterNotifier = StateProvider<String>((ref) {
  return 'Delivery';
});
final itemQuantityNotifier = StateProvider<int>((ref) => 0);
final selectedPaymentMethodNotifier = StateProvider<String>((ref)=>'Cash on delivery');
final selectedItemPricenotifier = StateProvider<double>((ref)=>0);
final selectedCuisineFiltersNotifier = StateProvider<List<String>>((ref) => []);
final applyButtonNotifier = StateProvider<bool>((ref) => false);
final resetButtonNotifier = StateProvider<bool>((ref) => false);
final bottomNavIndex = StateProvider<int>((ref) {
  return 0;
});
final searchProvider = StateProvider<String>((ref) {
  return '';
});

final recommendedCategoryChipsNotifier = StreamProvider<List<CategoryModel>>((
  ref,
) {
  return FirebaseServices.fetchCategories();
});

class CategoryNotifier extends StateNotifier<List<CategoryModel>> {
  CategoryNotifier() : super([]);

  void addCategory(CategoryModel category) {
    state.add(category);
    state = state.toList();
  }

  void updateCategory(String id, bool isSelected) {
    final index = state.indexWhere((category) => category.id == id);
    state[index] = state[index].copyWith(isSelected: isSelected);
    state = state.toList();
  }

  void removeCategory(String id) {
    final index = state.indexWhere((category) => category.id == id);
    state.removeAt(index);
    state = state.toList();
  }
}
