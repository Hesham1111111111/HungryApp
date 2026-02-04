class ToppingsModel {
  final int id;

  final String name;

  final String image;

  ToppingsModel({required this.id, required this.name, required this.image});

  factory ToppingsModel.fromJson(Map<String, dynamic> json) {
    return ToppingsModel(
      id: json["id"],
      name: json["name"],
      image: json["image"],
    );
  }
}
