import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/product_model.dart';
import '../view_models/basket/basket_bloc.dart';

class BasketItemWidget extends StatelessWidget {
  final ProductModel product;
  final int quantity;

  const BasketItemWidget({
    super.key,
    required this.product,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              product.image,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$quantity packs',
                  style: const TextStyle(color: Colors.black54, fontSize: 14),
                ),
              ],
            ),
          ),

          Text(
            '\$ ${(product.price * quantity).toStringAsFixed(0)}',
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF3E245D),
              fontWeight: FontWeight.bold,
            ),
          ),

          IconButton(
            icon: const Icon(Icons.remove_circle_outline),
            onPressed: () {
              context.read<BasketBloc>().add(
                RemoveFromBasket(productModel: product),
              );
            },
          ),
        ],
      ),
    );
  }
}
