import 'package:flutter_bloc/flutter_bloc.dart';
import 'remove_cart_state.dart';
import '../../data/repo/remove_cart_repo/remove_cart_repo.dart';

class RemoveCartCubit extends Cubit<RemoveCartState> {
  final RemoveCartRepo removeCartRepo;

  RemoveCartCubit(this.removeCartRepo) : super(RemoveCartInitial());

  Future<void> removeItem(int id) async {
    emit(RemoveCartLoading());

    try {
      await removeCartRepo.removeCart(id);
      emit(RemoveCartSuccess());
    } catch (e) {
      emit(RemoveCartError(error: e.toString()));
    }
  }
}
