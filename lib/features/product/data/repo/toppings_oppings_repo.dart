import 'package:dartz/dartz.dart';
import 'package:hungry/features/product/data/model/side_options_model.dart';
import 'package:hungry/features/product/data/model/toppings_model.dart';

abstract class ToppingsAndSoppingsRepo {
  Future<Either<String, List<ToppingsModel>>> fetchToppings();

  Future<Either<String, List<SideOptionsModel>>> fetchSideOptions();
}
