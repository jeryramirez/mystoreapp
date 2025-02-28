import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_store/features/product/model/product_model.dart';

Future<List<ProductModel>> fetchProducts() async {
  final response = await http.get(
    Uri.parse('https://dummyjson.com/products'),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    Map<String, dynamic> jsonResponse = json.decode(response.body);
    List<dynamic> productsJson = jsonResponse['products'];
    return productsJson.map((productJson) => ProductModel.fromJson(productJson)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}