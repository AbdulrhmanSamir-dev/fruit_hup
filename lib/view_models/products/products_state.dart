part of 'products_bloc.dart';

sealed class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

final class ProductsInitial extends ProductsState {}


final class ProductLoading extends ProductsState {}

final class ProductLoaded extends ProductsState {
  final List<ProductModel> products;

  const ProductLoaded( this.products);


}

final class ProductError extends ProductsState {
  final String message;

  const ProductError(this.message);
}