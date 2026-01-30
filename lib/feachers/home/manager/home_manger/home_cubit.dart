import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/home_repo.dart';
import '../../data/repo/home_repo_impl.dart';
import 'home_state.dart';

class HomeProductCubit extends Cubit<HomeProductState> {
  HomeProductCubit() : super(InitialHomeProductState());

  final HomeRepo homeRepo = HomeRepoImpl();


  Future<void> getHomeProduct() async {
    emit(const LoadingHomeProductState());

    final result = await homeRepo.fetchProducts();

    result.fold(
          (error) => emit(ErrorHomeProductState(errorMessage: error)),
          (products) => emit(SuccessHomeProductState(products: products)),
    );
  }


  Future<void> searchProducts(String query) async {
    if (query.trim().isEmpty) {

      await getHomeProduct();
      return;
    }

    emit(const LoadingHomeProductState());

    final result = await homeRepo.searchProducts(query);

    result.fold(
          (error) => emit(ErrorHomeProductState(errorMessage: error)),
          (products) => emit(SuccessHomeProductState(products: products)),
    );
  }
}
