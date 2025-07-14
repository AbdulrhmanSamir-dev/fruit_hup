import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/data/local_products.dart';

import '../../models/product_model.dart';

part 'products_event.dart';

part 'products_state.dart';
class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsInitial()) {
    on<LoadRecommendProducts>((event, emit) {
      emit(ProductLoading());
      try {
        final recommended = demoProducts
            .where((p) => p.category.contains('combo'))
            .toList();
        emit(ProductLoaded(recommended));
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });

    on<ProductsByTags>((event, emit) {
      emit(ProductLoading());
      try {
        final filtered = demoProducts
            .where((p) => p.category.contains(event.tag.toLowerCase()))
            .toList();
        emit(ProductLoaded(filtered));
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });

    on<SearchProducts>((event, emit) {
      emit(ProductLoading());

      final query = event.query.trim().toLowerCase();

      if (query.isEmpty) {
        final recommended =
        demoProducts.where((p) => p.category.contains('combo')).toList();
        emit(ProductLoaded(recommended));
      } else {
        final filtered = demoProducts
            .where((product) => product.name.toLowerCase().contains(query))
            .toList();

        emit(ProductLoaded(filtered));
      }
    });
  }
}
