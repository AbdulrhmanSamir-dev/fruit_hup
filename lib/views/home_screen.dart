import 'package:flutter/material.dart';
import 'package:fruit_hup/views/basket_screen.dart';
import 'package:fruit_hup/widgets/custom_product_card.dart';
import 'package:fruit_hup/widgets/custom_search_field.dart';
import 'package:fruit_hup/widgets/product_section_with_tabs.dart';

import '../constants/app_constants.dart';
import '../services/init_get_it.dart';
import '../services/navigation_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.02), // ~16-20px

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.sort, size: 28),
                  GestureDetector(
                    onTap: (){
                      getIt<NavigationService>().navigate(const BasketScreen());

                    },
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/fruitHupPics/basket11-removebg-preview.png',
                          height: screenHeight * 0.035, // ~25px
                        ),
                        SizedBox(height: screenHeight * 0.005),
                        const Text(
                          'My Basket',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: screenHeight * 0.03),

              SizedBox(
                width: screenWidth * 0.75,
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    children: [
                      TextSpan(text: 'Hello Tony, '),
                      TextSpan(
                        text:
                        'What fruit salad combo do you want today?',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.03),

              Row(
                children: [
                  const Expanded(child: CustomSearchField()),
                  SizedBox(width: screenWidth * 0.03),
                  Container(
                    padding: EdgeInsets.all(screenWidth * 0.03),
                    decoration: BoxDecoration(
                      color: AppConstants.KmianColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.tune, color: Colors.white),
                  ),
                ],
              ),

              SizedBox(height: screenHeight * 0.04),

              const Text(
                'Recommended Combo',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: screenHeight * 0.02),

              Row(
                children: [
                  const Expanded(
                    child: CustomProductCard(
                      imagePath: 'assets/fruitHupPics/item-removebg-preview.png',
                      title: 'Honey Lime combo',
                      price: '2,000',
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.03),
                  const Expanded(
                    child: CustomProductCard(
                      imagePath: 'assets/fruitHupPics/item-removebg-preview.png',
                      title: 'Honey Lime combo',
                      price: '2,000',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),

              SizedBox(height: screenHeight * 0.035),

              const ProductSectionWithTabs(),

              SizedBox(height: screenHeight * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
