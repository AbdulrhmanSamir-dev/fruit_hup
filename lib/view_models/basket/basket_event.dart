part of 'basket_bloc.dart';

sealed class BasketEvent extends Equatable {
  const BasketEvent();
}

class AddToBasket extends BasketEvent {
  final ProductModel productModel;

  const AddToBasket({required this.productModel});

  @override
  List<Object> get props => [productModel];
}

class RemoveFromBasket extends BasketEvent{
  final ProductModel productModel;

  const RemoveFromBasket({required this.productModel});

  @override
  List<Object> get props=>[productModel];
}

class ClearBasket extends BasketEvent{
  @override
  List<Object> get props=>[];
}
