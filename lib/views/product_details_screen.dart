import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/models/product_model.dart';
import 'package:fruit_hup/widgets/custom_button.dart';
import '../constants/app_constants.dart';
import '../view_models/basket/basket_bloc.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel productModel;
  const ProductDetailsScreen({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
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
                child: Image.asset(productModel.image),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 55),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 95,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.arrow_back_ios_sharp, size: 24),
                            Text('Go Back'),
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
                              child: BlocBuilder<BasketBloc, BasketState>(
                                builder: (context, state) {
                                  int quantity = 0;
                                  if (state is BasketUpdated && state.basketItems.containsKey(productModel)) {
                                    quantity = state.basketItems[productModel]!;
                                  }

                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 20.0),
                                        child: Text(
                                          productModel.name,
                                          style: const TextStyle(
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
                                            InkWell(
                                              onTap: () {
                                                context.read<BasketBloc>().add(RemoveFromBasket(productModel: productModel));
                                              },
                                              child: Container(
                                                height: 32,
                                                width: 32,
                                                decoration: BoxDecoration(
                                                  border: Border.all(color: Colors.black, width: 2),
                                                  borderRadius: BorderRadius.circular(20),
                                                ),
                                                child: const Icon(Icons.remove),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 16),
                                              child: Text('$quantity', style: const TextStyle(fontSize: 32)),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                context.read<BasketBloc>().add(AddToBasket(productModel: productModel));
                                              },
                                              child: Container(
                                                height: 30,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                  color: Colors.orange.shade50,
                                                  borderRadius: BorderRadius.circular(20),
                                                ),
                                                child: const Icon(Icons.add, color: AppConstants.KmianColor, size: 32),
                                              ),
                                            ),
                                            const Spacer(),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 16),
                                              child: Text(
                                                '\$ ${(productModel.price * quantity).toStringAsFixed(0)}',
                                                style: const TextStyle(fontSize: 26),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 30),
                                      const Padding(
                                        padding: EdgeInsets.all(20.0),
                                        child: Text(
                                          'Product Details...',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 20),
                                        child: CustomButton(
                                          onTap: () {
                                            context.read<BasketBloc>().add(AddToBasket(productModel: productModel));
                                          },
                                          buttonName: 'Add to Basket',
                                        ),
                                      ),
                                      const SizedBox(height: 30),
                                    ],
                                  );
                                },
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