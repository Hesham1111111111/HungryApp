import 'package:dartz/dartz.dart';
import 'package:hungry/feachers/product/data/model/side_options_model.dart';
import 'package:hungry/feachers/product/data/model/toppings_model.dart';

abstract class ToppingsRepo {
  Future<Either<String, List<ToppingsModel>>> fetchToppings();

  Future<Either<String, List<SideOptionsModel>>> fetchSideOptions();
}
