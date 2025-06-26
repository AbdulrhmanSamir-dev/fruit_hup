import 'package:flutter/material.dart';
import 'package:fruit_hup/widgets/custom_product_card.dart';

import '../constants/app_constants.dart';

class ProductSectionWithTabs extends StatefulWidget {
  const ProductSectionWithTabs({super.key});

  @override
  State<ProductSectionWithTabs> createState() => _ProductSectionWithTabsState();
}

class _ProductSectionWithTabsState extends State<ProductSectionWithTabs> {
  int selectedIndex = 0;

  final List<String> tabs = ['Hottest', 'Popular', 'New combo', 'Top'];
  final List<Color> productCardColor = const [
    Color(0xFFFFE0B2),
    Color(0xFFFFF9C4),
    Color(0xFFC8E6C9),
    Color(0xFFB3E5FC),
    Color(0xFFD1C4E9),
    Color(0xFFFFCDD2),
    Color(0xFFF8BBD0),
    Color(0xFFFFF3E0),
  ];

  final Map<String, List<Map<String, dynamic>>> productsByTab = {
    'Hottest': [
      {
        'image': 'assets/fruitHupPics/item-removebg-preview.png',
        'title': 'Mango',
        'price': '4.99',
      },
      {
        'image': 'assets/fruitHupPics/item-removebg-preview.png',
        'title': 'Strawberry',
        'price': '5.49',
      },
      {
        'image': 'assets/fruitHupPics/item-removebg-preview.png',
        'title': 'Strawberry',
        'price': '5.49',
      },
      {
        'image': 'assets/fruitHupPics/item-removebg-preview.png',
        'title': 'Strawberry',
        'price': '5.49',
      },
      {
        'image': 'assets/fruitHupPics/item-removebg-preview.png',
        'title': 'Strawberry',
        'price': '5.49',
      },
      {
        'image': 'assets/fruitHupPics/item-removebg-preview.png',
        'title': 'Strawberry',
        'price': '5.49',
      },
      {
        'image': 'assets/fruitHupPics/item-removebg-preview.png',
        'title': 'Strawberry',
        'price': '5.49',
      },
      {
        'image': 'assets/fruitHupPics/item-removebg-preview.png',
        'title': 'Strawberry',
        'price': '5.49',
      },
      {
        'image': 'assets/fruitHupPics/item-removebg-preview.png',
        'title': 'Strawberry',
        'price': '5.49',
      },
      {
        'image': 'assets/fruitHupPics/item-removebg-preview.png',
        'title': 'Strawberry',
        'price': '5.49',
      },
    ],
    'Popular': [
      {
        'image': 'assets/fruitHupPics/item-removebg-preview.png',
        'title': 'Apple',
        'price': '3.99',
      },
      {
        'image': 'assets/fruitHupPics/item-removebg-preview.png',
        'title': 'Orange',
        'price': '4.25',
      },
      {
        'image': 'assets/fruitHupPics/item-removebg-preview.png',
        'title': 'Orange',
        'price': '4.25',
      },
      {
        'image': 'assets/fruitHupPics/item-removebg-preview.png',
        'title': 'Orange',
        'price': '4.25',
      },
      {
        'image': 'assets/fruitHupPics/item-removebg-preview.png',
        'title': 'Orange',
        'price': '4.25',
      },
      {
        'image': 'assets/fruitHupPics/item-removebg-preview.png',
        'title': 'Orange',
        'price': '4.25',
      },
      {
        'image': 'assets/fruitHupPics/item-removebg-preview.png',
        'title': 'Orange',
        'price': '4.25',
      },
    ],
    'New combo': [
      {
        'image': 'assets/fruitHupPics/item-removebg-preview.png',
        'title': 'Fruit Salad',
        'price': '6.99',
      },
      {
        'image': 'assets/fruitHupPics/item-removebg-preview.png',
        'title': 'Fruit Salad',
        'price': '6.99',
      },
      {
        'image': 'assets/fruitHupPics/item-removebg-preview.png',
        'title': 'Fruit Salad',
        'price': '6.99',
      },
      {
        'image': 'assets/fruitHupPics/item-removebg-preview.png',
        'title': 'Fruit Salad',
        'price': '6.99',
      },
      {
        'image': 'assets/fruitHupPics/item-removebg-preview.png',
        'title': 'Fruit Salad',
        'price': '6.99',
      },
      {
        'image': 'assets/fruitHupPics/item-removebg-preview.png',
        'title': 'Fruit Salad',
        'price': '6.99',
      },
    ],
    'Top': [
      {
        'image': 'assets/fruitHupPics/item-removebg-preview.png',
        'title': 'Banana',
        'price': '2.99',
      },
      {
        'image': 'assets/fruitHupPics/item-removebg-preview.png',
        'title': 'Banana',
        'price': '2.99',
      },
      {
        'image': 'assets/fruitHupPics/item-removebg-preview.png',
        'title': 'Banana',
        'price': '2.99',
      },
      {
        'image': 'assets/fruitHupPics/item-removebg-preview.png',
        'title': 'Banana',
        'price': '2.99',
      },
      {
        'image': 'assets/fruitHupPics/item-removebg-preview.png',
        'title': 'Banana',
        'price': '2.99',
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    final selectedTab = tabs[selectedIndex];
    final currentProducts = productsByTab[selectedTab]!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(tabs.length, (index) {
              final isSelected = index == selectedIndex;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tabs[index],
                        style: TextStyle(
                          fontSize: isSelected ? 18 : 16,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.normal,
                          color: isSelected ? Colors.black : Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 4),
                      if (isSelected)
                        Container(
                          width: 25,
                          height: 3,
                          color: AppConstants.KmianColor,
                        ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),

        const SizedBox(height: 12),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: currentProducts.length,
            itemBuilder: (context, index) {
              final product = currentProducts[index];
              final color=productCardColor[index%productCardColor.length];
              return CustomProductCard(
                imagePath: product['image'],
                title: product['title'],
                price: product['price'], color: color,
              );
            },
          ),
        ),
      ],
    );
  }
}
