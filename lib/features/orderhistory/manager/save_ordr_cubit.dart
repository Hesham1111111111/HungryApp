import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/features/orderhistory/data/repo/sava_order_repo.dart';
import 'package:hungry/features/orderhistory/manager/save_order_state.dart';

class SaveOrderCubit extends Cubit<SaveOrderState> {
  SaveOrderCubit(this.saveOrderRepo) : super(SaveOrderInitial());
  final SaveOrderRepo saveOrderRepo;

  Future<void> saveOrder(int id) async {
    try {
      emit(SaveOrderLoading());
      final result = await saveOrderRepo.saveOrder(id);
      emit(SaveOrderSuccess(saveOrder: result));
    } catch (e) {
      emit(SaveOrderError(errorMessage: e.toString()));
    }
  }
}
