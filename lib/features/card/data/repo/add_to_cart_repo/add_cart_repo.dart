import '../../model/add_to_cart_model/add_to_cart_model.dart';

abstract class CartRepo {
  Future<void> addToCart(CartRequestModel cartData);
}
