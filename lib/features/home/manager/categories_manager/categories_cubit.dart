import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/features/home/data/repo/home_repo.dart';
import 'package:hungry/features/home/data/repo/home_repo_impl.dart';
import 'package:hungry/features/home/manager/categories_manager/categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this.homeRepo) : super(InitialCategoriesState());
  final HomeRepo homeRepo ;

  Future<void> getCategories() async {
    emit(LoadingCategoriesState());
    var result = await homeRepo.fetchCategories();
    result.fold(
      (error) {
        emit(ErrorCategoriesState(errorMessage: error));

      },
      (categories) {
        emit(SuccessCategoriesState(categories: categories));
      },
    );
  }
}
