import 'package:flutter/material.dart';
import 'package:riverpodpractice/presentation/home/restaurant/item_detail.dart';
import 'package:riverpodpractice/widgets/custom_animated_container.dart';
import 'package:riverpodpractice/widgets/custom_text_widget.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ItemCardSmall extends StatelessWidget {
  final String imagePath;
  final bool? isSlidable;
  const ItemCardSmall({super.key, required this.imagePath, this.isSlidable});

  @override
  Widget build(BuildContext context) {
    return CustomAnimatedContainer(
      height: 150,
      borderRadius: 20,
      verMargin: 5,
      borderColor: Colors.grey.shade400,
      borderWidth: 1,
      horPadding: isSlidable ?? false ? 0 : 12,
      verPadding: isSlidable ?? false ? 0 : 10,
      topBorder: true,
      bottomBorder: true,
      rightBorder: true,
      leftBorder: true,
      color:
          isSlidable ?? false
              ? Colors.red
              : Theme.of(context).colorScheme.surface,
      child:
          isSlidable ?? false
              ? Slidable(
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  extentRatio: 0.25,
                  children: [
                    SlidableAction(
                      onPressed: (context) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text('Item deleted')));
                      },
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                    ),
                  ],
                ),
                child: CustomAnimatedContainer(
                  height: 150,
                  borderRadius: 18,
                  horPadding: 12,
                  verPadding: 10,
                  color: Theme.of(context).colorScheme.surface,
                  child: _itemContent(context),
                ),
              )
              : _itemContent(context),
    );
  }

  Widget _itemContent(BuildContext context) {
    return InkWell(
      onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ItemDetail(),
                      ),
                    );
                  },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              height: 120,
              width: 120,
              child: Image.asset(imagePath, fit: BoxFit.cover),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextWidget(
                    text: 'Special Chips',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  SizedBox(width: 5),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 18),
                      SizedBox(width: 5),
                      CustomTextWidget(
                        text: '4.8 (1.2k)',
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ],
                  ),
                  SizedBox(width: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextWidget(
                        text: 'PKR: 1200',
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                      Icon(Icons.favorite_outline),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
