import 'package:flutter/material.dart';

class CartWidget extends StatelessWidget {
    const CartWidget({
      required this.totalProducts,
      required this.onPressed,
      super.key
    });

    final Function onPressed;
    final int totalProducts;

  @override
  Widget build(BuildContext context) {
    return Stack(
            children: [
              IconButton(onPressed: () => onPressed(), icon: Icon(Icons.shopping_cart)),
              if(totalProducts > 0)
              Positioned(
                right: 0,
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color.from(alpha: 1, red: 0.98, green: 0.776, blue: 0.043),
                  ),
                  child: Center(child: Text("$totalProducts", style: TextStyle(fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 0, 0, 0)),))
                )
              ),
            ],
          );
  }
}