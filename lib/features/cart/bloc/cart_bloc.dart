import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/cart/bloc/cart_event.dart';
import 'package:my_store/features/cart/bloc/cart_state.dart';

class CartProductBloc extends Bloc<CartEvent, CartState> {
  CartProductBloc() : super(const CartState()) {
    on<AddProductToCart>(addProductToCart);
    on<PurchaseCart>(purchaseCart);
  }

  void purchaseCart(
    PurchaseCart event,
    Emitter<CartState> emit,
  ){
    emit(
      state.copyWith(
        cartProducts: [],
      )
    );
  } 

  Future<void> addProductToCart(
      AddProductToCart event,
      Emitter<CartState> emit,
    ) async {
      emit(state.copyWith(cartProductsLoading: true));

      final product = state.cartProducts.firstWhereOrNull( (element) => element.id == event.cartProduct.id);

      if(product != null){
      
        final productsCopy = [...state.cartProducts];
        final index = productsCopy.indexWhere((element) => element.id == product.id);
        if(event.cartProduct.quantity > 0){
          productsCopy[index] = event.cartProduct;
        }else{
          productsCopy.removeAt(index);
        }
        
        emit(
          state.copyWith( 
            cartProducts: productsCopy,
            cartProductsLoading: false,
          )
        );
      } else {
        emit(
          state.copyWith(
            cartProducts: [...state.cartProducts, event.cartProduct],
          )
        );
      }
  }
}