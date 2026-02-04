import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/features/product/manager/side_option_manager/side_option_state.dart';

import '../../data/repo/toppings_oppings_impl.dart';
import '../../data/repo/toppings_oppings_repo.dart';


class SideOptionsCubit extends Cubit<SideOptionsState> {
  SideOptionsCubit(this.toppingsRepo) : super(InitialSideOptionsState());

  final ToppingsAndSoppingsRepo toppingsRepo ;

  Future<void> getSideOptions() async {
    emit(LoadingSideOptionsState());

    try {
      final result = await toppingsRepo.fetchSideOptions();

      result.fold(
            (error) {
          emit(ErrorSideOptionsState(errorMassege: error));
        },
            (sideOptions) {
          emit(
            SuccessSideOptionsState(sideOptions: sideOptions),
          );
        },
      );
    } catch (e) {
      emit(
        ErrorSideOptionsState(errorMassege: e.toString()),
      );
    }
  }
}
