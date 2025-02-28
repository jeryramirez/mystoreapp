import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/cart/bloc/cart_bloc.dart';
import 'package:my_store/features/cart/bloc/cart_event.dart';
import 'package:my_store/features/cart/widget/cart_product_card.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {

    final cartProducts = context.watch<CartProductBloc>().state.cartProducts;
    final totalProductsQuantity = cartProducts.isNotEmpty ? cartProducts.map((element) => element.quantity).reduce((value, element) => value + element) : 0;
    final totalProducts = cartProducts.isNotEmpty ? cartProducts.map((element) => element.totalPrice).reduce((value, element) => value + element) : 0;


    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text('MyStore'),
      ),
      body: cartProducts.isNotEmpty ? Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 16, 0, 0),
                child: Row(
                  children: [
                    Text(
                      "Total to pay: ",
                      style: TextStyle(
                        fontSize: 16
                      ),
                    ),
                    Text(
                      'USD\$ ${totalProducts.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                      
                      onPressed: (){
                        Navigator.popAndPushNamed(context, '/purchase');
                        context.read<CartProductBloc>().add(PurchaseCart());
                      } ,
                      
                      label: Text("Purchase ($totalProductsQuantity) products", style: TextStyle(
                        color: Colors.black,
                        
                      ),),
                      
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.from(alpha: 1, red: 0.98, green: 0.776, blue: 0.043),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      )
                    ),
                ),
              ),
            ],
          ) ,
          Expanded(
            child: ListView.builder(
              itemCount: cartProducts.length,
              itemBuilder: (_, index) {
                return CartProductCard(
                  cartProducts: cartProducts[index]
              );}
            ),
          ),
        ],
      ) : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.remove_shopping_cart_outlined, size: 80, color: Color.from(alpha: 1, red: 0.98, green: 0.776, blue: 0.043),),
            Text("Your cart is empty yet.", style: TextStyle(fontSize: 24),),
          ],
        ),
      )
    );
  }
}