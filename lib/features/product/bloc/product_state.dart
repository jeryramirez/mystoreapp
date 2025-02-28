import 'package:equatable/equatable.dart';
import 'package:my_store/features/product/model/product_model.dart';

final class ProductState extends Equatable {
  const ProductState({
    this.products = const [],
    this.productsLoading = false,
  });

  final List<ProductModel> products;
  final bool productsLoading;


  @override
  List<Object?> get props => [products];

  ProductState copyWith({
    List<ProductModel>? products,
    bool? productsLoading,

  }) {
    return ProductState(
      products: products ?? this.products,
      productsLoading: productsLoading ?? this.productsLoading,

    );
  }
}
