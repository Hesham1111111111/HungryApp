import 'package:hungry/core/resources/images.dart';
import 'package:hungry/features/card/data/model/get_cart_model/side_option_model.dart';
import 'package:hungry/features/card/data/model/get_cart_model/topping_model.dart';

class OrderItem {
  final int itemId;
  final int productId;
  final String name;
  final String image;
  final int quantity;
  final double price;
  final double spicy;
  final List<Topping> toppings;
  final List<SideOption> sideOptions;

  OrderItem({
    required this.itemId,
    required this.productId,
    required this.name,
    required this.image,
    required this.quantity,
    required this.price,
    required this.spicy,
    required this.toppings,
    required this.sideOptions,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      itemId: json['item_id'],
      productId: json['product_id'],
      name: json['name'],
      image: json['image']??AppImages.my,
      quantity: json['quantity'],
      price: double.parse(json['price']),
      spicy: double.tryParse(json['spicy'].toString()) ?? 0.0,
      toppings: (json['toppings'] as List)
          .map((e) => Topping.fromJson(e))
          .toList(),
      sideOptions: (json['side_options'] as List)
          .map((e) => SideOption.fromJson(e))
          .toList(),
    );
  }
}
