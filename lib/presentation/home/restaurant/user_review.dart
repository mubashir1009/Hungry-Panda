import 'package:flutter/material.dart';
import 'package:riverpodpractice/core/constants/assets.dart';
import 'package:riverpodpractice/widgets/custom_animated_container.dart';
import 'package:riverpodpractice/widgets/custom_text_widget.dart';

class UserReview extends StatelessWidget {
  const UserReview({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAnimatedContainer(
      borderRadius: 20,
      horMargin: 5,
      horPadding: 5,
      verPadding: 5,
      verMargin: 4,
      color: Colors.grey.shade400.withAlpha(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipOval(
                child: Image.asset(
                  demoProfilePic,
                  height: 36,
                  width: 36,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 6),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(text: 'Mubashir Sikander'),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber),
                      Icon(Icons.star, color: Colors.amber),
                      Icon(Icons.star, color: Colors.amber),
                      Icon(Icons.star, color: Colors.amber),
                      Icon(Icons.star, color: Colors.grey.shade400),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 6),
          CustomTextWidget(
            text:
                'KababJees is a family-friendly restaurant known for its rich flavors, fresh ingredients, and warm ambiance. From sizzling kebabs to traditional curries, every dish is crafted with passion to give you an unforgettable dining experience.',
            color: Colors.grey.shade400,
            overflow: TextOverflow.clip,
            fontSize: 12,
          ),
          SizedBox(height: 6),
          Row(
            children: [
              Row(
                children: [
                  Icon(Icons.favorite, color: Colors.red, size: 20),
                  SizedBox(width: 5,),
                  CustomTextWidget(
                    text: '298',
                    color: Colors.grey.shade400,
                    overflow: TextOverflow.clip,
                    fontSize: 12,
                  ),
                ],
              ),
              SizedBox(width: 10),
              CustomTextWidget(
                text: '6 days ago',
                color: Colors.grey.shade400,
                overflow: TextOverflow.clip,
                fontSize: 12,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
