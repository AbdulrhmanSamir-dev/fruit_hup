import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/models/product_model.dart';
import 'package:fruit_hup/view_models/basket/basket_bloc.dart';
import 'package:fruit_hup/views/product_details_screen.dart';
import '../constants/app_constants.dart';
import '../services/init_get_it.dart';
import '../services/navigation_service.dart';

class CustomProductCard extends StatelessWidget {
  final ProductModel productModel;
  final Color color;

  const CustomProductCard({super.key, required this.color, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasketBloc, BasketState>(
      builder: (context, state) {
        int quantity = 0;
        if (state is BasketUpdated && state.basketItems.containsKey(productModel)) {
          quantity = state.basketItems[productModel]!;
        }

        return InkWell(
          onTap: () {
            getIt<NavigationService>().navigate(
              ProductDetailsScreen(productModel: productModel),
            );
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
                  color: Colors.grey.withOpacity(0.2),
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
                      child: Image.asset(productModel.image, height: 80, fit: BoxFit.contain),
                    ),
                    const Positioned(
                      top: 0,
                      right: 0,
                      child: Icon(Icons.favorite_border, color: AppConstants.KmianColor, size: 20),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(productModel.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${productModel.price}',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppConstants.KmianColor),
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
                        child: const Icon(Icons.add, color: AppConstants.KmianColor, size: 20),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}