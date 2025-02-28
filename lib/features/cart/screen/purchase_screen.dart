import 'package:flutter/material.dart';

class PurchaseScreen extends StatefulWidget {
  const PurchaseScreen({super.key});

  @override
  State<PurchaseScreen> createState() => _PurchaseScreenState();
}

class _PurchaseScreenState extends State<PurchaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text('MyStore'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopify_sharp,
            size: 120, color: Color.from(alpha: 1, red: 0.98, green: 0.776, blue: 0.043),),
            Text("Your purchase has been completed succeed.", style: TextStyle(fontSize: 24, ), textAlign: TextAlign.center,),
          ],
        ),
      )
    );
  }
}