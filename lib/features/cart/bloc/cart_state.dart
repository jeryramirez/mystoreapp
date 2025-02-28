import 'package:equatable/equatable.dart';
import 'package:my_store/features/cart/model/cart_product_model.dart';

final class CartState extends Equatable {
  const CartState({
    this.cartProducts = const [],
    this.cartProductsLoading = false,
  });

  final List<CartProductModel> cartProducts;
  final bool cartProductsLoading;


  @override
  List<Object?> get props => [cartProducts];

  CartState copyWith({
    List<CartProductModel>? cartProducts,
    bool? cartProductsLoading,

  }) {
    return CartState(
      cartProducts: cartProducts ?? this.cartProducts,
      cartProductsLoading: cartProductsLoading ?? this.cartProductsLoading,

    );
  }
}
