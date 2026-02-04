class Topping {
  final int id;
  final String name;
  final String image;

  Topping({
    required this.id,
    required this.name,
    required this.image,
  });

  factory Topping.fromJson(Map<String, dynamic> json) {
    return Topping(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}
