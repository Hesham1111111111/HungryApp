class SideOption {
  final int id;
  final String name;
  final String image;

  SideOption({
    required this.id,
    required this.name,
    required this.image,
  });

  factory SideOption.fromJson(Map<String, dynamic> json) {
    return SideOption(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}
