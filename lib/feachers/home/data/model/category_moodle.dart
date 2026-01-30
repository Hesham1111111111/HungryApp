class ProductModel {
  final int id;
  final String name;
  final String image;
  final String desc;
  final String rating;
  final String price;

  ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.desc,
    required this.rating,
    required this.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      image: json["image"] ?? "",
      desc: json["description"] ?? "",
      rating: json["rating"] ?? "",
      price: json["price"] ?? "",
    );
  }
}
