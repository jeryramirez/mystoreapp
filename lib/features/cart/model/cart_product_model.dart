
class CartProductModel {
  final String id;
  final String title;
  final double rating;
  final double price;
  final String imageUrl;
  final int quantity;

  const CartProductModel({
    required this.id,
    required this.title, 
    required this.rating, 
    required this.price,
    required this.imageUrl,
    required this.quantity
  });
  
  double get totalPrice => (price * quantity);

  // factory CartProductModel.fromProduct(ProductModel product){
    // return CardProductModel(
    //   id: product.id,
    //   imageUrl: product.imageUrl,
    //   price: product.price

    // )
  // }

CartProductModel copyWith({
    String? id,
    String? title,
    double? rating,
    double? price,
    String? imageUrl,
    double? total,
    int? quantity,
  }) {
    return CartProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      rating: rating ?? this.rating,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      quantity: quantity ?? this.quantity,
    );
  }

}