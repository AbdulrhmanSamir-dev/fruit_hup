import 'package:flutter/material.dart';

import '../constants/app_constants.dart';

class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Container(
              height: 135,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppConstants.KmianColor,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(4)),
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 1,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.arrow_back_ios_new, size: 22),
                          SizedBox(width: 5),
                          Text('Go back', style: TextStyle(fontSize: 14)),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(flex: 2),
                  const Text(
                    'Delivery Status',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  const Spacer(flex: 5),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.purple.shade200,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withValues(alpha: 0.2),
                            blurRadius: 6,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Image.asset(
                        'assets/fruitHupPics/orderTakenPic-removebg-preview.png',
                      ),
                    ),
                    AppConstants.kcustomDot,
                    AppConstants.kcustomDot,
                    AppConstants.kcustomDot,
                    AppConstants.kcustomDot,
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text('Order Taken', style: TextStyle(fontSize: 16)),
                ),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Icon(
                    Icons.check_circle_rounded,
                    size: 34,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade200,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withValues(alpha: 0.2),
                            blurRadius: 6,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Image.asset(
                        'assets/fruitHupPics/orderIsBeingPreparedPic-removebg-preview.png',
                      ),
                    ),
                    AppConstants.kcustomDot,
                    AppConstants.kcustomDot,
                    AppConstants.kcustomDot,
                    AppConstants.kcustomDot,
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Order Is Being Prepared',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Icon(
                    Icons.check_circle_rounded,
                    size: 34,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.yellow.shade200,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withValues(alpha: 0.2),
                            blurRadius: 6,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Image.asset(
                        'assets/fruitHupPics/orderIsBeingDeliveredPic-removebg-preview.png',
                      ),
                    ),
                    AppConstants.kcustomDot,
                    AppConstants.kcustomDot,
                    AppConstants.kcustomDot,
                    AppConstants.kcustomDot,
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10.0, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order Is Being Delivered',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Your delivery agent is coming',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.deepOrangeAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.phone_in_talk_outlined,
                      size: 34,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              height: 150,
              width: double.infinity,
              child: Image.asset(
                'assets/fruitHupPics/map-removebg-preview.png',
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppConstants.kcustomDot,
                    AppConstants.kcustomDot,
                    AppConstants.kcustomDot,
                    AppConstants.kcustomDot,
                    Container(
                      width: 60,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.pink.shade100,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withValues(alpha: 0.2),
                            blurRadius: 6,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.check_circle_rounded,
                        size: 36,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 70),
                  child: Text('Order Received', style: TextStyle(fontSize: 16)),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0, top: 60),
                  child: Icon(
                    Icons.more_horiz_outlined,
                    size: 55,
                    color: Colors.pink.shade200,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
