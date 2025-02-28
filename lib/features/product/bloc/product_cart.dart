
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/cart/bloc/cart_bloc.dart';
import 'package:my_store/features/cart/bloc/cart_event.dart';
import 'package:my_store/features/cart/model/cart_product_model.dart';
import 'package:my_store/features/product/model/product_model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    required this.product,
    super.key
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final mainContainerWidth = screenWidth * 0.95;
    return GestureDetector(
      child: Center(
        
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Container(
            width: mainContainerWidth,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              border: Border(
                bottom: BorderSide(
                  width: 1.0,
                  color: const Color.fromARGB(255, 232, 232, 232)
                )
              )
            ),
            child: Row(
              children: [
                SizedBox(
                  width: mainContainerWidth * 0.35,
                  child: Column(
                    children: [
                      Image.network(
                        product.imageUrl,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: mainContainerWidth * 0.65,
                  
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                    
                      children:[
                        CardTitle(title: product.title,),
                        CardRated(rate: product.rating),
                        CardPrice(price: product.price),
                        CartButton(product: product)
                      ]
                    ),
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardTitle extends StatelessWidget {
  const CardTitle({

    required this.title,
    super.key
  });


  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 150,
          child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              title,
              overflow: TextOverflow.visible,
              softWrap: true,
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CardRated extends StatelessWidget {
  const CardRated({
    required this.rate,
    super.key
  });

  final double rate;

  @override
  Widget build(BuildContext context) {
    
    return Row(
      children: 
        List.generate(rate.floor(), (index) {
          return const Icon(Icons.star, color: Color.from(alpha: 1, red: 0.98, green: 0.776, blue: 0.043),);
        })
    );
  }
}

class CardPrice extends StatelessWidget {
  const CardPrice({
    required this.price,
    super.key
  });

  final double price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("$price", style: TextStyle(
          fontSize: 18
        ),)
      ],
    );
  }
}

class CartButton extends StatelessWidget {
  const CartButton({
    required this.product,
    super.key
    });


  final ProductModel product;
  @override
  Widget build(BuildContext context) {

    final cartProducts = context.watch<CartProductBloc>().state.cartProducts;

    CartProductModel cartProduct = cartProducts.firstWhere( (element) => element.id == product.id, orElse: (){
          return CartProductModel(
            id: product.id, 
            title: product.title, 
            rating: product.rating, 
            price: product.price, 
            imageUrl: product.imageUrl, 
            quantity: 0
          );
        });
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: SizedBox(
        height: 36,
        child: Row(
          children: [
            cartProduct.quantity > 0 
            ? Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: ElevatedButton.icon(
                      onPressed: (){
                        cartProduct = cartProduct.copyWith(quantity: 0);
                        context.read<CartProductBloc>().add(AddProductToCart(cartProduct: cartProduct));
                      },
                      icon: Icon(Icons.shopping_cart, color: const Color.fromARGB(255, 255, 255, 255),), 
                      label: Text(
                        "Remove", 
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 250, 11, 11),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.horizontal(left: Radius.circular(8))
                        ),
                      )
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Row(
                      children: [
                    SizedBox(
                      width: 4,
                    ),
                    Flexible(
                      child: IconButton(
                        onPressed: (){
                          cartProduct = cartProduct.copyWith(quantity: cartProduct.quantity - 1);
                          context.read<CartProductBloc>().add(AddProductToCart(cartProduct: cartProduct));
                        },
                        
                        icon: Icon(Icons.remove, color: Colors.black, size: 16,),
                        
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 230, 230, 230),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero
                          ),
                        )
                      ),
                    ),
                    SizedBox(width: 28, child: Center(child: Text("${cartProduct.quantity}"))),
                    Flexible(
                      child: IconButton(
                        onPressed: (){
                          cartProduct = cartProduct.copyWith(quantity: cartProduct.quantity + 1);
                          context.read<CartProductBloc>().add(AddProductToCart(cartProduct: cartProduct));
                        },
                        
                        icon: Icon(Icons.add, color: Colors.black, size: 16,),
                        
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 230, 230, 230),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.horizontal(right: Radius.circular(8))
                          ),
                        )
                      ),
                    ),
                                  
                      ],
                    ),
                  )
                  
              
                ],
              ),
            ) : ElevatedButton.icon(
    
              onPressed: (){
                cartProduct = cartProduct.copyWith(quantity: cartProduct.quantity + 1);
                context.read<CartProductBloc>().add(AddProductToCart(cartProduct: cartProduct));
              },
              
              icon: Icon(Icons.shopping_cart, color: Colors.black,), 
              label: Text("Add to cart", style: TextStyle(
                color: Colors.black,
                
              ),),
              
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.from(alpha: 1, red: 0.98, green: 0.776, blue: 0.043),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              )
            ) 
          ],
        ),
      ),
    );
  }
}