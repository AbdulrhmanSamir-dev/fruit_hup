import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/view_models/products/products_bloc.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final firstTag=tabs[0].toLowerCase();
    context.read<ProductsBloc>().add(ProductsByTags(tag: firstTag));
  }


  @override
  Widget build(BuildContext context) {
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
                  final tag = tabs[index].toLowerCase();

                  context.read<ProductsBloc>().add(ProductsByTags(tag: tag));
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
        BlocBuilder<ProductsBloc, ProductsState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (state is ProductLoaded) {
              final products = state.products;
              return SizedBox(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    final color =
                        productCardColor[index % productCardColor.length];
                    return CustomProductCard(
                      productModel: product,
                      color: color,
                    );
                  },
                ),
              );
            }else if(state is ProductError){
              return Center(child: Text(state.message));
            }else{
              return const SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}
