import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodpractice/core/model/item_model.dart';
import 'package:riverpodpractice/notifiers/item_notifier.dart';
import 'package:riverpodpractice/widgets/custom_elevated_button.dart';
import 'package:riverpodpractice/widgets/custom_text_widget.dart';
import 'package:riverpodpractice/widgets/custom_textformfield.dart';

class AddItem extends ConsumerWidget {
  const AddItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: colorScheme.secondary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextWidget(text: 'Add Item'),
              SizedBox(height: 10),
              CustomTextWidget(text: 'Please enter details of items below'),
              Form(
                key: ref.read(itemNotifierProvider.notifier).formkey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller:
                          ref
                              .read(itemNotifierProvider.notifier)
                              .nameController,
                      focusNode:
                          ref.read(itemNotifierProvider.notifier).nameFocusNode,
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
                    CustomTextFormField(
                      focusNode:
                          ref
                              .read(itemNotifierProvider.notifier)
                              .descriptionFocusNode,
                      controller:
                          ref
                              .read(itemNotifierProvider.notifier)
                              .descriptionController,
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
                        if (ref
                            .read(itemNotifierProvider.notifier)
                            .formkey
                            .currentState!
                            .validate()) {
                          final random = Random();
                          final item = ItemModel(
                            id: random.nextInt(1000).toString(),
                            name:
                                ref
                                    .read(itemNotifierProvider.notifier)
                                    .nameController
                                    .text,
                            description:
                                ref
                                    .read(itemNotifierProvider.notifier)
                                    .descriptionController
                                    .text,
                            price: 100,
                            quantity: 100,
                          );
                          ref.read(itemNotifierProvider.notifier).addItem(item);
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: colorScheme.primary,
                              content: CustomTextWidget(
                                text: 'Item added successfully!',
                                color: colorScheme.onPrimary,
                              ),
                              duration: Duration(seconds: 2),
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: colorScheme.primary,
                              content: CustomTextWidget(
                                text: 'Please fill equired fields',
                                color: colorScheme.onPrimary,
                              ),
                              duration: Duration(seconds: 2),
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        }
                      },
                      child: CustomTextWidget(text: 'Add Item'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
