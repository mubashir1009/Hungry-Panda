import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodpractice/core/model/item_model.dart';
import 'package:riverpodpractice/notifiers/item_notifier.dart';
import 'package:riverpodpractice/widgets/custom_elevated_button.dart';
import 'package:riverpodpractice/widgets/custom_text_widget.dart';
import 'package:riverpodpractice/widgets/custom_textfield.dart';

class UpdateItem extends ConsumerWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final ItemModel item;
  UpdateItem({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    nameController.text = item.name;
    descriptionController.text = item.description;
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.secondary,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              controller: nameController,
              radius: 8,
              width: MediaQuery.of(context).size.width * 0.77,
              fillColor: Colors.grey.shade400.withAlpha(60),
              hint: 'Enter Item Name',
              labelColor: Colors.grey,
              hintColor: Colors.grey,
              borderColor: colorScheme.onPrimary,
              focusedBorderColor: colorScheme.onPrimary,
              borderWidth: 1,
              preffixIcon: Icon(Icons.search, color: Colors.grey),
            ),
            SizedBox(height: 10),
            CustomTextField(
              controller: descriptionController,
              radius: 8,
              width: MediaQuery.of(context).size.width * 0.77,
              fillColor: Colors.grey.shade400.withAlpha(60),
              hint: 'Enter Item Description',
              labelColor: Colors.grey,
              hintColor: Colors.grey,
              borderColor: colorScheme.onPrimary,
              focusedBorderColor: colorScheme.onPrimary,
              borderWidth: 1,
              preffixIcon: Icon(Icons.search, color: Colors.grey),
            ),
            SizedBox(height: 10),
            CustomElevatedButton(
              onPressed: () {
                final item = this.item.copyWith(
                  name: nameController.text,
                  description: descriptionController.text,
                  price: 120,
                  quantity: 200,
                );
                ref.read(itemNotifierProvider.notifier).updateItem(item);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: colorScheme.primary,
                    content: CustomTextWidget(
                      text: 'Item updated successfully!',
                      color: colorScheme.onPrimary,
                    ),
                    duration: Duration(seconds: 2),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              child: CustomTextWidget(text: 'Update Item'),
            ),
          ],
        ),
      ),
    );
  }
}
