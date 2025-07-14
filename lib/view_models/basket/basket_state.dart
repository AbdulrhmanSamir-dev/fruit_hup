part of 'basket_bloc.dart';

sealed class BasketState extends Equatable {
  const BasketState();
}

final class BasketInitial extends BasketState {
  @override
  List<Object> get props => [];
}

class BasketUpdated extends BasketState{
final Map<ProductModel,int> basketItems;
   const BasketUpdated( this.basketItems);

  @override
  List<Object> get props=>[basketItems];
}

