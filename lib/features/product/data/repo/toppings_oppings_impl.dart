import 'package:dartz/dartz.dart';
import 'package:hungry/core/network/api_endpoint.dart';
import 'package:hungry/core/network/api_error.dart';
import 'package:hungry/core/network/api_server.dart';
import 'package:hungry/features/product/data/model/side_options_model.dart';
import 'package:hungry/features/product/data/model/toppings_model.dart';
import 'package:hungry/features/product/data/repo/toppings_oppings_repo.dart';

class ToppingsAndSoppingsRepoImpl implements ToppingsAndSoppingsRepo {

  final ApiServer apiServer ;

  ToppingsAndSoppingsRepoImpl({required this.apiServer});

  Future<Either<String, List<ToppingsModel>>> fetchToppings() async {
    try {
      var response = await apiServer.get(endpoint: ApiEndpoints.toppings);
      if (response is Map<String, dynamic> && response.containsKey("data")) {
        final toppings = (response['data'] as List)
            .map((e) => ToppingsModel.fromJson(e))
            .toList();
        return right(toppings);
      } else if (response is ApiError) {
        return left(response.message);
      } else {
        return left("Unknown error occurred ");
      }
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<SideOptionsModel>>> fetchSideOptions() async {
    try {
      var response = await apiServer.get(endpoint: ApiEndpoints.sideOptions);
      if (response is Map<String, dynamic> && response.containsKey('data')) {
        final sideOptions = (response['data'] as List)
            .map((e) => SideOptionsModel.fromJson(e))
            .toList();
        return right(sideOptions);
      } else if (response is ApiError) {
        return Left(response.message);
      } else {
        return Left("unknown error occurred");
      }
    } catch (e) {
      return left(e.toString());
    }
  }
}
