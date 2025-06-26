import 'package:flutter/material.dart';

class BasketItemWidget extends StatelessWidget {
  const BasketItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(
                'assets/fruitHupPics/item-removebg-preview.png',
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 16),

            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Quinoa fruit salad',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '2packs',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),

            const Spacer(),

            const Text(
              '\$ 20,000',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF3E245D),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
            height: 2,
            width: double.infinity,
            color: Colors.grey.shade100,
          ),
        )
      ],
    );
  }
}
