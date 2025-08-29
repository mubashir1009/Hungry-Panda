import 'package:flutter/material.dart';
import 'package:riverpodpractice/presentation/home/restaurant/offer_widget.dart';
import 'package:riverpodpractice/presentation/home/widgets/back_to.dart';

class RestaurantOffers extends StatelessWidget {
  const RestaurantOffers({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackTo(
              title: 'Offers are available',
              iconColor: colorScheme.onSurface,
            ),
            SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OfferWidget(
                      title: 'Promo New User',
                      subTitle: 'Valid for new users',
                    ),
                    OfferWidget(
                      title: 'Free Delivery',
                      subTitle: 'Free delivery max PKR: 50/-',
                    ),
                    OfferWidget(
                      title: 'Extra 20% OFF',
                      subTitle: 'Discount 20% off',
                    ),
                    OfferWidget(
                      title: 'Special Friday',
                      subTitle: 'Only for friday',
                    ),
                    OfferWidget(
                      title: 'Promo New Menu',
                      subTitle: 'Valid for new menu',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
