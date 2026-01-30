import 'order_Item.dart';

class OrderData {
  final int id;
  final String totalPrice;
  final List<OrderItem> item;

  OrderData({
    required this.id,
    required this.totalPrice,
    required this.item,
  });

  factory OrderData.fromJson(Map<String, dynamic> json) {
    final itemsList = json['items'] as List;

    return OrderData(
      id: json['id'] as int,
      totalPrice: json['total_price'].toString(),
      item: itemsList.map((e) => OrderItem.fromJson(e)).toList(),
    );
  }
}
