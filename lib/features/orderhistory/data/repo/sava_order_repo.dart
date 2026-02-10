import '../model/sava_order.dart';

abstract class SaveOrderRepo {
  Future<SaveOrder> saveOrder(int id);
}
