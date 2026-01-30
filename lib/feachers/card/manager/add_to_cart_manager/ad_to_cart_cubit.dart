import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/add_to_cart_model/add_to_cart_model.dart';
import '../../data/repo/add_to_cart_repo/add_cart_repo.dart';
import 'add_to_curt_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo cartRepo;

  CartCubit(this.cartRepo) : super(CartInitialState());

  Future<void> addToCart(CartRequestModel cartData) async {
    emit(CartLoadingState());

    try {
      await cartRepo.addToCart(cartData);
      emit(CartSuccessState());
    } catch (e) {
      emit(CartErrorState( message: e.toString()));
    }
  }
}
