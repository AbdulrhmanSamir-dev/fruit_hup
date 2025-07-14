import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/views/basket_screen.dart';
import 'package:fruit_hup/widgets/custom_product_card.dart';
import 'package:fruit_hup/widgets/custom_search_field.dart';
import 'package:fruit_hup/widgets/product_section_with_tabs.dart';
import '../constants/app_constants.dart';
import '../services/init_get_it.dart';
import '../services/navigation_service.dart';
import '../view_models/products/products_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.clientName});

  final String clientName;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    context.read<ProductsBloc>().add(const LoadRecommendProducts());
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

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
              SizedBox(height: screenHeight * 0.02),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.sort, size: 28),
                  GestureDetector(
                    onTap: () {
                      getIt<NavigationService>().navigate(const BasketScreen());
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/fruitHupPics/basket11-removebg-preview.png',
                          height: screenHeight * 0.035,
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
                  text: TextSpan(
                    style: const TextStyle(fontSize: 18, color: Colors.black),
                    children: [
                      TextSpan(text: 'Hello ${widget.clientName}, '),
                      const TextSpan(
                        text: 'What fruit salad combo do you want today?',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.03),

              Row(
                children: [
                  Expanded(
                    child: CustomSearchField(
                      controller: _searchController,
                      onChanged: (value) {
                        setState(() {
                          _searchQuery = value;
                        });
                        context.read<ProductsBloc>().add(
                          SearchProducts(query: value),
                        );
                      },
                    ),
                  ),
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

              _searchQuery.isNotEmpty
                  ? BlocBuilder<ProductsBloc, ProductsState>(
                    builder: (context, state) {
                      if (state is ProductLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is ProductLoaded) {
                        final results = state.products;
                        if (results.isEmpty) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Center(child: Text("No results found.",style: TextStyle(fontSize: 24),)),
                          );
                        }

                        return ListView.separated(
                          itemCount: results.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder:
                              (context, index) => const SizedBox(height: 10),
                          itemBuilder: (context, index) {
                            final product = results[index];
                            return CustomProductCard(
                              productModel: product,
                              color: Colors.grey.shade100,
                            );
                          },
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  )
                  : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Recommended Combo',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: screenHeight * 0.02),

                      BlocBuilder<ProductsBloc, ProductsState>(
                        builder: (context, state) {
                          if (state is ProductLoading) {
                            return const Center(
                              child: CircularProgressIndicator.adaptive(),
                            );
                          } else if (state is ProductLoaded) {
                            final products = state.products;
                            return Row(
                              children: [
                                ...List.generate(products.length.clamp(0, 2), (
                                  index,
                                ) {
                                  final p = products[index];
                                  return Expanded(
                                    child: CustomProductCard(
                                      productModel: p,
                                      color: Colors.white,
                                    ),
                                  );
                                }),
                              ],
                            );
                          } else if (state is ProductError) {
                            return Center(child: Text(state.message));
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      ),

                      SizedBox(height: screenHeight * 0.035),
                      const ProductSectionWithTabs(),
                    ],
                  ),

              SizedBox(height: screenHeight * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
