class ProductModel {
  final String id;
  final String title;
  final double rating;
  final double price;
  final String imageUrl;

  const ProductModel({
    required this.id,
    required this.title, 
    required this.rating, 
    required this.price,
    required this.imageUrl
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json["meta"]["barcode"],
        title: json["title"],
        rating: json["rating"],
        price: json["price"],
        imageUrl: json["thumbnail"],
      );
    }
}