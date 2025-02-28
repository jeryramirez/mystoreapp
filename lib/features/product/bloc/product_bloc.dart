import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/product/bloc/product_event.dart';
import 'package:my_store/features/product/bloc/product_state.dart';
import 'package:my_store/http.dart';



class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(const ProductState()) {
    on<GetProducts>(getProducts);
  }

  Future<void> getProducts(
      GetProducts event,
      Emitter<ProductState> emit,
    ) async {
      emit(state.copyWith(productsLoading: true));
      
      final futureProducts = await fetchProducts();

      emit(
        state.copyWith(
          products: futureProducts,
          productsLoading: false,
        ),
      );
  }
}