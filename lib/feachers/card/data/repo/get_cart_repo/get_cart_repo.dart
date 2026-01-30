import 'package:dartz/dartz.dart';

import '../../model/get_cart_model/get_cart_model.dart';

abstract class GetCartRepo {
  Future<Either<String, List<OrderDetailsResponse>>> getCartRepo();
}
