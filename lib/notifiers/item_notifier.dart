import 'dart:convert';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodpractice/core/model/item_model.dart';

// item notifier provider
final itemNotifierProvider =
    StateNotifierProvider<ItemNotifier, List<ItemModel>>((ref) {
      return ItemNotifier();
    });

final searchProvider = StateProvider<String>(
  (ref) => '',
); // search provider for searchbar
final butonProvider = StateProvider<bool>(
  (ref) => false,
); // button hover provider

// filtered iten notifier for adding search functionality
final filteredItemsNotifierProvider = StateProvider<List<ItemModel>>((ref) {
  final items = ref.watch(itemNotifierProvider);
  final searchQuery = ref.watch(searchProvider);
  log('query::$searchQuery');
  if (searchQuery.isEmpty) return items;

  return items
      .where(
        (item) => item.name.toLowerCase().contains(searchQuery.toLowerCase()),
      )
      .toList();
});

// Future method
Future<List<String>> fetchUsers() async {
  try {
    log("fetchUsers called");
    final res = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
      headers: {"Accept": "application/json"},
    );
    if (res.statusCode == 200) {
      final List<dynamic> data = jsonDecode(res.body);
      return data.map((e) => e['name'] as String).toList();
    } else {
      log("Request failed: ${res.statusCode}");
      return [];
    }
  } catch (e, st) {
    log('Error in fetching users data::$e ::$st');
    return [];
  }
}

// Stream method
Stream<List<String>> fetchItems() {
  try {
    final docRef = FirebaseFirestore.instance.collection('Items');
    return docRef.snapshots().map((snapshot) {
      List<String> itemName = [];
      for (var itemDoc in snapshot.docs) {
        final data = itemDoc.data();
        itemName.add(data['name']);
      }
      return itemName;
    });
  } catch (e, st) {
    log('Error while getting stream of items ::$e, ::$st');
    return Stream.empty();
  }
}

// Future Provider
final asyncUsersProvider = FutureProvider<List<String>>((ref) {
  return fetchUsers();
});

// Stream Provider
final asyncStreamUsersProvider = StreamProvider<List<String>>((ref) {
  return fetchItems();
});

class ItemNotifier extends StateNotifier<List<ItemModel>> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final nameFocusNode = FocusNode();
  final descriptionFocusNode = FocusNode();
  ItemNotifier()
    : super(
        List.generate(
          10,
          (index) => ItemModel(
            id: '${index + 1}',
            name: 'Food Item ${index + 1}',
            description: 'Description for item ${index + 1}',
            price: 50 + (index * 10),
            quantity: 5 + index,
          ),
        ),
      );

  void addItem(ItemModel item) {
    state.add(item);
    state = state.toList();
  }

  void updateItem(ItemModel updatedItem) {
    final index = state.indexWhere((item) => item.id == updatedItem.id);
    final selectedItem = state[index];
    state[index] = selectedItem.copyWith(
      name: updatedItem.name,
      description: updatedItem.description,
      price: updatedItem.price,
      quantity: updatedItem.quantity,
    );
    state = state.toList();
  }

  void removeItem(ItemModel removeItem) {
    state.removeWhere((item) => item.id == removeItem.id);
    state = state.toList();
  }
}
