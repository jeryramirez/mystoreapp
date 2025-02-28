import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/features/cart/bloc/cart_bloc.dart';
import 'package:my_store/features/cart/screen/cart_screen.dart';
import 'package:my_store/features/cart/screen/purchase_screen.dart';
import 'package:my_store/features/product/screen/product_screen.dart';
import 'package:my_store/features/product/bloc/product_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

      providers: [
        BlocProvider(create: (_) => ProductBloc()),
        BlocProvider(create: (_) => CartProductBloc()),
      ],
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 255, 255)),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => ProductsScreen(),
        '/cart': (context) => CartScreen(),
        '/purchase': (context) => PurchaseScreen(),
      },
    ),
      );
  }
}