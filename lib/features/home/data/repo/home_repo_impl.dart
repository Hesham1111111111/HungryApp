import 'package:dartz/dartz.dart';
import 'package:hungry/core/network/api_endpoint.dart';
import 'package:hungry/core/network/api_server.dart';
import 'package:hungry/features/home/data/model/categories_model.dart';
import '../../../../core/network/api_error.dart';
import '../model/category_moodle.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiServer apiServer ;

  HomeRepoImpl( {required this.apiServer});

  @override
  Future<Either<String, List<ProductModel>>> fetchProducts() async {
    try {
      final response = await apiServer.get(endpoint: ApiEndpoints.products);

      // تحقق من نوع response
      if (response is Map<String, dynamic> && response.containsKey('data')) {
        final products = (response['data'] as List)
            .map((e) => ProductModel.fromJson(e))
            .toList();
        return Right(products);
      } else if (response is ApiError) {
        return Left(response.message); // أو أي حقل عندك بيشرح الخطأ
      } else {
        return Left('Unknown error occurred');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<CategoriesModel>>> fetchCategories() async {
    try {
      final response = await apiServer.get(endpoint: ApiEndpoints.categories);

      if (response is Map<String, dynamic> && response.containsKey('data')) {
        final categories = (response['data'] as List)
            .map((e) => CategoriesModel.fromJson(e))
            .toList();

        return Right(categories);
      } else if (response is ApiError) {
        return Left(response.message);
      } else {
        return Left('Unknown error occurred');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<ProductModel>>> searchProducts(String name) async {
    try {
      final response = await apiServer.get(
        endpoint: ApiEndpoints.products,
        queryParameters: {'name': name},
      );

      if (response is Map<String, dynamic> && response.containsKey('data')) {
        final products = (response['data'] as List)
            .map((e) => ProductModel.fromJson(e))
            .toList();
        return Right(products);
      } else if (response is ApiError) {
        return Left(response.message);
      } else {
        return const Left('Unknown error occurred');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

}
