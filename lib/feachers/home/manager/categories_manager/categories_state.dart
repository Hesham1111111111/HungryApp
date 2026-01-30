import 'package:hungry/feachers/home/data/model/categories_model.dart';

abstract class CategoriesState {}

class InitialCategoriesState extends CategoriesState {}

class LoadingCategoriesState extends CategoriesState {}

class SuccessCategoriesState extends CategoriesState {
  final List<CategoriesModel> categories;

  SuccessCategoriesState({required this.categories});
}

class ErrorCategoriesState extends CategoriesState {
  final String errorMessage;

  ErrorCategoriesState({required this.errorMessage});
}
