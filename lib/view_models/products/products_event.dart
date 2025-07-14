part of 'products_bloc.dart';

sealed class ProductsEvent extends Equatable {
  const ProductsEvent();
}

class LoadRecommendProducts extends ProductsEvent {
  const LoadRecommendProducts();

  @override
  List<Object?> get props => [];
}

class ProductsByTags extends ProductsEvent {
  final String tag;

  const ProductsByTags({required this.tag});

  @override
  List<Object?> get props => [tag];
}

class SearchProducts extends ProductsEvent{
  final String query;

  const SearchProducts({required this.query});
  @override
  List<Object?> get props => [query];
}
