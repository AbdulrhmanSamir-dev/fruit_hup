import 'package:flutter/material.dart';
import 'package:fruit_hup/widgets/custom_button.dart';

import '../constants/app_constants.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int packsNum = 0;
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Container(
              color: AppConstants.KmianColor,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .55,
                width: double.infinity,
                child: Image.asset(
                  'assets/fruitHupPics/item-removebg-preview.png',
                ),
              ),
            ),

            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0, top: 55),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 95,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.arrow_back_ios_sharp,
                              size: 24,
                              weight: 500,
                            ),
                            Text(
                              'Go Back',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * .35),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: Material(
                            borderRadius: BorderRadius.circular(24),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 20.0),
                                    child: Text(
                                      'Quinoa Fruit Salad',
                                      style: TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff27214D),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 32,
                                          width: 32,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.black,
                                              width: 2,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                          ),
                                          child: const Icon(
                                            Icons.remove,
                                            color: Colors.black,
                                            size: 28,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0,
                                          ),
                                          child: Text(
                                            packsNum.toString(),
                                            style: const TextStyle(fontSize: 32),
                                          ),
                                        ),
                                        Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                            color: Colors.orange.shade50,
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                          ),
                                          child: const Icon(
                                            Icons.add,
                                            color: AppConstants.KmianColor,
                                            size: 32,
                                          ),
                                        ),
                                        const Spacer(),
                                        const Padding(
                                          padding: EdgeInsets.only(
                                            right: 16.0,
                                          ),
                                          child: Text(
                                            '\$2000',
                                            style: TextStyle(fontSize: 26),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Container(
                                    height: 1,
                                    width: double.infinity,
                                    color: Colors.grey.shade400,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      left: 20.0,
                                      top: 20,
                                    ),
                                    child: Text(
                                      'One Pack Contains:',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff27214D),
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      left: 20.0,
                                      top: 10,
                                      right: 10,
                                    ),
                                    child: Text(
                                      'Red Quinoa, Lime, Honey, Blueberries, Strawberries, Mango, Fresh mint.',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xff27214D),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Container(
                                    height: 1,
                                    width: double.infinity,
                                    color: Colors.grey.shade400,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      left: 20.0,
                                      top: 10,
                                      right: 10,
                                    ),
                                    child: Text(
                                      'If you are looking for a new fruit salad to eat today, quinoa is the perfect brunch for you. make',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xff27214D),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20.0,right: 20),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: () {},
                                          child: Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              color: Colors.orange.shade50,
                                              borderRadius: BorderRadius.circular(
                                                20,
                                              ),
                                            ),
                                            child: const Icon(
                                              Icons.favorite_border,
                                              color: AppConstants.KmianColor,
                                              size: 30,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.sizeOf(context).width*.6,
                                          child: CustomButton(
                                            onTap: (){},
                                            buttonName: 'add to basket',
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
