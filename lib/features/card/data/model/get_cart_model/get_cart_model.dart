import 'order_data_model.dart';

class OrderDetailsResponse {
  final int code;
  final String message;
  final List<OrderData> data;

  OrderDetailsResponse({
    required this.code,
    required this.message,
    required this.data,
  });

  factory OrderDetailsResponse.fromJson(Map<String, dynamic> json) {
    // نحول الـ Object ل List
    final order = OrderData.fromJson(json['data'] as Map<String, dynamic>);
    return OrderDetailsResponse(
      code: json['code'] as int,
      message: json['message'] as String,
      data: [order],
    );
  }
}
