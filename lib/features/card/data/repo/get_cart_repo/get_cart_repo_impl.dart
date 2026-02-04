import 'package:dartz/dartz.dart';
import 'package:hungry/core/network/api_endpoint.dart';
import 'package:hungry/core/network/api_server.dart';
import 'package:hungry/features/card/data/model/get_cart_model/get_cart_model.dart';
import 'get_cart_repo.dart';

class GetCartRepoImpl implements GetCartRepo {
  final ApiServer apiServer ;

  GetCartRepoImpl({required this.apiServer});

  @override
  Future<Either<String, List<OrderDetailsResponse>>> getCartRepo() async {
    try {
      final response = await apiServer.get(endpoint: ApiEndpoints.cart);
      if (response is Map<String, dynamic> && response.containsKey("data")) {
        final order = OrderDetailsResponse.fromJson(response);
        final cartItems = [order];
        return Right(cartItems );
      } else {
        return Left("Invalid response from server");
      }
    } catch (e) {
      return Left("Error: ${e.toString()}");
    }
  }
}
