class SaveOrder {
  final int code;
  final String message;
  final SaveOrderData data;

  SaveOrder({
    required this.code,
    required this.message,
    required this.data,
  });

  factory SaveOrder.fromJson(Map<String, dynamic> json) {
    return SaveOrder(
      code: json['code'],
      message: json['message'],
      data: SaveOrderData.fromJson(json['data']),
    );
  }
}

class SaveOrderData {
  final int orderId;

  SaveOrderData({required this.orderId});

  factory SaveOrderData.fromJson(Map<String, dynamic> json) {
    return SaveOrderData(
      orderId: json['order_id'],
    );
  }

}
