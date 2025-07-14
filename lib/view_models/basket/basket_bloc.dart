import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/models/product_model.dart';

part 'basket_event.dart';
part 'basket_state.dart';
class BasketBloc extends Bloc<BasketEvent, BasketState> {
  final Map<ProductModel, int> _basketItems = {};

  BasketBloc() : super(BasketInitial()) {
    on<AddToBasket>((event, emit) {
      if (_basketItems.containsKey(event.productModel)) {
        _basketItems[event.productModel] = _basketItems[event.productModel]! + 1;
      } else {
        _basketItems[event.productModel] = 1;
      }
      emit(BasketUpdated(Map.from(_basketItems)));
    });

    on<RemoveFromBasket>((event, emit) {
      if (_basketItems.containsKey(event.productModel)) {
        final currentQty = _basketItems[event.productModel]!;
        if (currentQty > 1) {
          _basketItems[event.productModel] = currentQty - 1;
        } else {
          _basketItems.remove(event.productModel);
        }
        emit(BasketUpdated(Map.from(_basketItems)));
      }
    });

    on<ClearBasket>((event, emit) {
      _basketItems.clear();
      emit(BasketUpdated(Map.from(_basketItems)));
    });
  }
}

