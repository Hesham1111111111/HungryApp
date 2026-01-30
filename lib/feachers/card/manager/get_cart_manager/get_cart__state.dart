import 'package:hungry/feachers/card/data/model/get_cart_model/get_cart_model.dart';

abstract class GetCartState {}

class GetCartInitial extends GetCartState {}

class GetCartLoading extends GetCartState {}

class GetCartSuccess extends GetCartState {
  final List<OrderDetailsResponse> orders;

  GetCartSuccess({required this.orders});
}

class GetCartError extends GetCartState {
  final String error;

  GetCartError({required this.error});
}
