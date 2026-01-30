import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/feachers/product/data/repo/toppings_repo.dart';
import 'package:hungry/feachers/product/manager/toppings_manager/toppings_state.dart';

import '../../data/repo/oppings_repoimpl.dart';

class ToppingsCubit extends Cubit<ToppingsState> {
  ToppingsCubit() : super(InitialToppingsState());

  final ToppingsRepo toppingsRepo = ToppingsRepoImpl();

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
