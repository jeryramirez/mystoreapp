import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/cart/bloc/cart_bloc.dart';
import 'package:my_store/features/cart/widget/cart_widget.dart';
import 'package:my_store/features/product/bloc/product_bloc.dart';
import 'package:my_store/features/product/widget/product_cart.dart';
import 'package:my_store/features/product/bloc/product_event.dart';
import 'package:my_store/features/product/model/product_model.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {

 late Future<List<ProductModel>> futureProducts;

  @override
  void initState() {
    super.initState();

    context.read<ProductBloc>().add(GetProducts());

  }
  @override
  Widget build(BuildContext context) {

    final products = context.watch<ProductBloc>().state.products;
    final cartProducts = context.watch<CartProductBloc>().state.cartProducts;

    final totalProducts = cartProducts.isNotEmpty ? cartProducts.map((element) => element.quantity).reduce((value, element) => value + element) : 0;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('MyStore'), 
        actions: [
          CartWidget(totalProducts: totalProducts, onPressed: () => Navigator.pushNamed(context, '/cart'),),
          SizedBox(
            width: 12,
          )
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (_, index) {
          return ProductCard(
            product: products[index],
        );}
      )
    );
  }
}