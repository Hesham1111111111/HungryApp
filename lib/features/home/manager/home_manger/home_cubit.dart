import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/category_moodle.dart';
import '../../data/repo/home_repo.dart';
import '../../data/repo/home_repo_impl.dart';
import 'home_state.dart';

class HomeProductCubit extends Cubit<HomeProductState> {
  HomeProductCubit(this.homeRepo) : super(const InitialHomeProductState());

  final HomeRepo homeRepo ;

  List<ProductModel> _allProducts = [];

  Future<void> getHomeProduct() async {
    emit(const LoadingHomeProductState());

    final result = await homeRepo.fetchProducts();

    result.fold(
          (error) => emit(ErrorHomeProductState(errorMessage: error)),
          (products) {
        _allProducts = products;
        emit(SuccessHomeProductState(products: products));
      },
    );
  }

  void searchProducts(String query) {
    if (query.trim().isEmpty) {
      emit(SuccessHomeProductState(products: _allProducts));
      return;
    }

    final filteredProducts = _allProducts.where((product) {
      return product.name
          .toLowerCase()
          .contains(query.toLowerCase());
    }).toList();

    emit(SuccessHomeProductState(products: filteredProducts));
  }
}
