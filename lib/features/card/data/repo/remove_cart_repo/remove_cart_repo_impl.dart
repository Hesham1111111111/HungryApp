import 'package:hungry/features/card/data/repo/remove_cart_repo/remove_cart_repo.dart';
import '../../../../../core/network/api_endpoint.dart';
import '../../../../../core/network/api_error.dart';
import '../../../../../core/network/api_server.dart';

class RemoveCartImpl implements RemoveCartRepo {
  final ApiServer apiServer ;

  RemoveCartImpl({required this.apiServer});

  @override
  Future<void> removeCart(int id) async {
    try {
      final response = await apiServer.delete(
        endpoint: "/cart/remove/$id",
      );

      if (response['code'] != 200) {
        throw ApiError(message: response["message"]);
      }
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }
}
