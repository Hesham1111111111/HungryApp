import 'package:hungry/feachers/product/data/model/toppings_model.dart';

abstract class ToppingsState {}

class InitialToppingsState extends ToppingsState {}

class LoadingToppingsState extends ToppingsState {}

class SuccessToppingsState extends ToppingsState {
  final List<ToppingsModel> toppingsModel;

  SuccessToppingsState({required this.toppingsModel});
}

class ErrorToppingsState extends ToppingsState {
  final String errorMassege;

  ErrorToppingsState({required this.errorMassege});
}

