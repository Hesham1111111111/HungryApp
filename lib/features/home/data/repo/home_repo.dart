import 'package:dartz/dartz.dart';
import 'package:hungry/features/home/data/model/categories_model.dart';
import 'package:hungry/features/home/data/model/category_moodle.dart';

abstract class HomeRepo {
  Future<Either<String, List<ProductModel>>> fetchProducts();

  Future<Either<String, List<ProductModel>>> searchProducts(String name);

  Future<Either<String, List<CategoriesModel>>> fetchCategories();
}
