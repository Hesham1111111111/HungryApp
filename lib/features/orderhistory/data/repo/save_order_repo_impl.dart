import 'package:hungry/core/network/api_endpoint.dart';
import 'package:hungry/core/network/api_server.dart';
import 'package:hungry/features/orderhistory/data/repo/sava_order_repo.dart';

import '../../../../core/network/api_error.dart';
import '../model/sava_order.dart';

class SaveOrderRepoImpl implements SaveOrderRepo {
  final ApiServer apiServer;

  SaveOrderRepoImpl({required this.apiServer});

  @override
  Future<SaveOrder> saveOrder(int id) async {
    var response = await apiServer.post(
      endpoint: ApiEndpoints.orders,
      data: {"order_id": id},
    );

    // تحقق إذا كان response من نوع ApiError
    if (response is ApiError) {
      throw Exception(response.message ?? "Unknown API error");
    }

    // لو response طبيعي
    return SaveOrder.fromJson(response.data);
  }

}
