import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repo/get_cart_repo/get_cart_repo_impl.dart';
import 'get_cart__state.dart';

class GetCartCubit extends Cubit<GetCartState> {
  final GetCartRepoImpl getCartRepo = GetCartRepoImpl();

  GetCartCubit() : super(GetCartInitial());

  Future<void> getCart() async {
    emit(GetCartLoading());
    final result = await getCartRepo.getCartRepo();
    result.fold(
            (error) => emit(GetCartError(error: error)),
            (orders) {
          emit(GetCartSuccess(orders: orders));
        }
    );
  }
}
