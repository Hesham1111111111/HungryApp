class CategoriesModel {
  final int id;

  final String name;

  CategoriesModel({required this.id, required this.name});

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(id: json["id"], name: json["name"]);
  }
}
