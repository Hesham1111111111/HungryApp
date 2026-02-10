import '../data/model/sava_order.dart';

class SaveOrderState {}

class SaveOrderInitial extends SaveOrderState {}

class SaveOrderLoading extends SaveOrderState {}

class SaveOrderSuccess extends SaveOrderState {
  final SaveOrder saveOrder;

  SaveOrderSuccess({required this.saveOrder});
}

class SaveOrderError extends SaveOrderState {
  final String errorMessage;

  SaveOrderError({required this.errorMessage});
}
