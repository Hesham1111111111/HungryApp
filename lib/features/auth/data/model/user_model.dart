class UserModel {
  final String name;
  final String email;
  final String  image;
  final String? token;
  final String? visa;

  final String? address;

  UserModel({
    required this.name,
    required this.email,
    required this.image,
    this.token,
    this.visa,
    this.address,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json["name"] ?? "Not Found",
      email: json["email"] ?? "Not Found",
      image: json["image"] ?? "Not Found",
      visa: json["Visa"] ?? "Not Found",
      token: json["token"] ?? "Not Found",
      address: json["address"] ?? "Not Found",
    );
  }
}
