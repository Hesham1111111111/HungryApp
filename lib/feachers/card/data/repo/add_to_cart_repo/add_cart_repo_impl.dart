import 'package:hungry/core/network/api_endpoint.dart';
import 'package:hungry/core/network/api_error.dart';
import 'package:hungry/core/network/api_server.dart';

import '../../model/add_to_cart_model/add_to_cart_model.dart';
import 'add_cart_repo.dart';

class CartRepoImpl implements CartRepo {
  final ApiServer apiServer = ApiServer();

  @override
  Future<void> addToCart(CartRequestModel cartData) async {
    try {
      await apiServer.post(
        endpoint: ApiEndpoints.addCart,
        data: cartData.toJson(),
      );
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }
}
