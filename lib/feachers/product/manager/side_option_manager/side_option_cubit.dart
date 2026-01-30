import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/feachers/product/data/repo/toppings_repo.dart';
import 'package:hungry/feachers/product/manager/side_option_manager/side_option_state.dart';

import '../../data/repo/oppings_repoimpl.dart';

class SideOptionsCubit extends Cubit<SideOptionsState> {
  SideOptionsCubit() : super(InitialSideOptionsState());

  final ToppingsRepo toppingsRepo = ToppingsRepoImpl();

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
