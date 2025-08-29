import 'package:flutter/material.dart';
import 'package:riverpodpractice/widgets/custom_animated_container.dart';
import 'package:riverpodpractice/widgets/custom_text_widget.dart';

class ItemCard extends StatelessWidget {
  final String imagePath;
  const ItemCard({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return CustomAnimatedContainer(
      borderRadius: 20,
      width: 250,
      borderColor: Theme.of(context).colorScheme.primary,
      borderWidth: 1,
      topBorder: true,
      bottomBorder: true,
      rightBorder: true,
      leftBorder: true,
      horPadding: 12,
      verPadding: 10,
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(imagePath),
            ),
          ),
          SizedBox(height: 8,),
          CustomTextWidget(text: 'Special Chips', fontWeight: FontWeight.bold, fontSize: 20,),
          SizedBox(height: 5,),
          Row(
            children: [
              Icon(Icons.star, color: Colors.amber, size: 18,),
              SizedBox(width: 5,),
              CustomTextWidget(text: '4.8 (1.2k)', color: Colors.grey, fontSize: 14,),
            ],
          ),
          SizedBox(height: 5,),
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
    );
  }
}
