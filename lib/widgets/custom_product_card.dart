import 'package:flutter/material.dart';
import 'package:fruit_hup/views/product_details_screen.dart';

import '../constants/app_constants.dart';
import '../services/init_get_it.dart';
import '../services/navigation_service.dart';

class CustomProductCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String price;
  final Color color;

  const CustomProductCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.price,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        getIt<NavigationService>().navigate(ProductDetailsScreen());

      },
      child: Container(
        width: 160,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.2),
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Center(
                  child: Image.asset(imagePath, height: 80, fit: BoxFit.contain),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.favorite_border,
                      color: AppConstants.KmianColor,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 4),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$$price',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppConstants.KmianColor,
                  ),
                ),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.orange.shade50,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(Icons.add, color: AppConstants.KmianColor, size: 20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
