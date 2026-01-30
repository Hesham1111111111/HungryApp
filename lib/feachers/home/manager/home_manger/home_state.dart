import 'package:hungry/feachers/home/data/model/category_moodle.dart';

sealed class HomeProductState {
  const HomeProductState();
}

class InitialHomeProductState extends HomeProductState {
  const InitialHomeProductState();
}

class LoadingHomeProductState extends HomeProductState {
  const LoadingHomeProductState();
}

class SuccessHomeProductState extends HomeProductState {
  final List<ProductModel> products;

  const SuccessHomeProductState({required this.products});
}

class ErrorHomeProductState extends HomeProductState {
  final String errorMessage;

  const ErrorHomeProductState({required this.errorMessage});
}
