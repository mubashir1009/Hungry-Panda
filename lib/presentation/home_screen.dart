import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodpractice/core/constants/app_text.dart';
import 'package:riverpodpractice/core/constants/assets.dart';
import 'package:riverpodpractice/main.dart';
import 'package:riverpodpractice/notifiers/item_notifier.dart';
import 'package:riverpodpractice/presentation/add_item.dart';
import 'package:riverpodpractice/presentation/update_item.dart';
import 'package:riverpodpractice/widgets/custom_animated_container.dart';
import 'package:riverpodpractice/widgets/custom_svg_widget.dart';
import 'package:riverpodpractice/widgets/custom_text_widget.dart';
import 'package:riverpodpractice/widgets/custom_textfield.dart';
import 'package:riverpodpractice/widgets/drawer.dart';

class HomeScreen extends ConsumerWidget {
  final searchController = TextEditingController();

  HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      drawer: AppDrawer(),
      backgroundColor: colorScheme.secondary,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              toolbarHeight: 140,
              backgroundColor: colorScheme.primary,
              automaticallyImplyLeading: false,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Builder(
                            builder: (context) {
                              return InkWell(
                                onTap: () => Scaffold.of(context).openDrawer(),
                                child: SvgWidget(
                                  image: menu,
                                  height: 15,
                                  width: 15,
                                  isColor: true,
                                  color: colorScheme.onPrimary,
                                ),
                              );
                            },
                          ),
                          SizedBox(width: 15),
                          CustomTextWidget(
                            text: shoppingMart,
                            color: colorScheme.onPrimary,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          color: colorScheme.surface,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  CustomTextWidget(
                    text:
                        '$helloText ${sharedPref!.getString('name')} $homeWelcomeText',
                    color: colorScheme.onPrimary,
                    fontSize: 18,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            SliverAppBar(
              toolbarHeight: 80,
              pinned: true,
              automaticallyImplyLeading: false,
              backgroundColor: colorScheme.onPrimary,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextField(
                    controller: searchController,
                    radius: 8,
                    width: MediaQuery.of(context).size.width * 0.77,
                    fillColor: Colors.grey.shade400.withAlpha(60),
                    hint: searchItems,
                    labelColor: Colors.grey,
                    onChanged: (val) {
                      ref.read(searchProvider.notifier).state = val;
                    },
                    hintColor: Colors.grey,
                    borderColor: colorScheme.onPrimary,
                    focusedBorderColor: colorScheme.onPrimary,
                    borderWidth: 1,
                    preffixIcon: Icon(Icons.search, color: Colors.grey),
                  ),
                  Consumer(
                    builder: (context, ref, _) {
                      final isTap = ref.watch(butonProvider);
                      return InkWell(
                        onTapUp:
                            (_) =>
                                ref.read(butonProvider.notifier).state = false,
                        onTapDown:
                            (_) =>
                                ref.read(butonProvider.notifier).state = true,
                        onTap: () {
                          ref.read(butonProvider.notifier).state = false;
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AddItem()),
                          );
                        },
                        child: AnimatedScale(
                          duration: Duration(milliseconds: 300),
                          scale: isTap ? 0.9 : 1,
                          child: CustomAnimatedContainer(
                            height: 30,
                            width: 30,
                            color:
                                isTap
                                    ? colorScheme.surface.withAlpha(60)
                                    : colorScheme.primary.withAlpha(60),
                            child: Icon(Icons.add, color: colorScheme.primary),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            SliverAppBar(
              pinned: true,
              automaticallyImplyLeading: false,
              backgroundColor: colorScheme.onPrimary,
              title: CustomAnimatedContainer(
                height: 40,
                color: colorScheme.primary.withAlpha(100),
                child: CustomTextWidget(text: staticItems),
              ),
            ),

            Consumer(
              builder: (context, ref, _) {
                final items = ref.watch(filteredItemsNotifierProvider);
                return items.isEmpty
                    ? SliverToBoxAdapter(
                      child: Center(
                        child: CustomTextWidget(text: noItemFound),
                      ),
                    )
                    : SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final item = items[index];
                        return ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomTextWidget(text: item.name),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) =>
                                                  UpdateItem(item: item),
                                        ),
                                      );
                                    },
                                    child: Icon(
                                      Icons.edit,
                                      color: colorScheme.surface,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  InkWell(
                                    onTap: () {
                                      ref
                                          .read(itemNotifierProvider.notifier)
                                          .removeItem(item);
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          backgroundColor: colorScheme.primary,
                                          content: CustomTextWidget(
                                            text: itemsRemoved,
                                            color: colorScheme.onPrimary,
                                          ),
                                          duration: Duration(seconds: 2),
                                          behavior: SnackBarBehavior.floating,
                                        ),
                                      );
                                    },
                                    child: Icon(
                                      Icons.delete,
                                      color: colorScheme.error,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          textColor: colorScheme.onSecondary,
                        );
                      }, childCount: items.length),
                    );
              },
            ),

            SliverAppBar(
              pinned: true,
              automaticallyImplyLeading: false,
              backgroundColor: colorScheme.onPrimary,
              title: CustomAnimatedContainer(
                height: 40,
                color: colorScheme.primary.withAlpha(100),
                child: CustomTextWidget(text: apiItems),
              ),
            ),

            Consumer(
              builder: (context, ref, _) {
                final usersAsync = ref.watch(asyncUsersProvider);

                return usersAsync.when(
                  data: (users) {
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => ListTile(
                          title: CustomTextWidget(
                            text: '${index + 1}. ${users[index]}',
                          ),
                        ),
                        childCount: users.length,
                      ),
                    );
                  },
                  error: (e, st) {
                    log("$error $e");
                    return SliverToBoxAdapter(
                      child: CustomTextWidget(text: "$error $e"),
                    );
                  },
                  loading: () {
                    return SliverToBoxAdapter(
                      child: CircularProgressIndicator(
                        color: colorScheme.primary,
                      ),
                    );
                  },
                );
              },
            ),

            SliverAppBar(
              pinned: true,
              automaticallyImplyLeading: false,
              backgroundColor: colorScheme.onPrimary,
              title: CustomAnimatedContainer(
                height: 40,
                color: colorScheme.primary.withAlpha(100),
                child: CustomTextWidget(text: streamItems),
              ),
            ),

            Consumer(
              builder: (context, ref, _) {
                final items = ref.watch(asyncStreamUsersProvider);
                return items.when(
                  data: (snapshotItems) {
                    return snapshotItems.isEmpty
                        ? SliverToBoxAdapter(
                          child: Center(
                            child: CustomTextWidget(
                              text: noStreamFound,
                            ),
                          ),
                        )
                        : SliverList(
                          delegate: SliverChildBuilderDelegate((
                            context,
                            index,
                          ) {
                            final item = snapshotItems[index];
                            return ListTile(
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomTextWidget(text: item),
                                ],
                              ),
                              textColor: colorScheme.onSecondary,
                            );
                          }, childCount: snapshotItems.length),
                        );
                  },
                  loading:
                      () => SliverToBoxAdapter(
                        child: SizedBox(
                          height: 25,
                          width: 25,
                          child: CircularProgressIndicator(
                            color: colorScheme.primary,
                          ),
                        ),
                      ),
                  error:
                      (e, _) => SliverToBoxAdapter(
                        child: CustomTextWidget(text: '$error: $e'),
                      ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
