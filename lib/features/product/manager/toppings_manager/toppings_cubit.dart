import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/features/product/manager/toppings_manager/toppings_state.dart';
import '../../data/repo/toppings_oppings_repo.dart';

class ToppingsCubit extends Cubit<ToppingsState> {
  ToppingsCubit(this.toppingsRepo) : super(InitialToppingsState());

  final ToppingsAndSoppingsRepo toppingsRepo ;

  Future<void> getToppings() async {
    emit(LoadingToppingsState());

    try {
      final result = await toppingsRepo.fetchToppings();

      result.fold(
        (error) => emit(ErrorToppingsState(errorMassege: error)),
        (toppings) => emit(SuccessToppingsState( toppingsModel: toppings)),
      );
    } catch (e) {
      emit(ErrorToppingsState(errorMassege: e.toString()));
    }
  }
}
