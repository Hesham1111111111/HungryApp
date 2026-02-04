import 'package:get_it/get_it.dart';
import 'package:hungry/core/network/api_server.dart';
import 'package:hungry/features/auth/data/repo/auth_repo_impl.dart';
import 'package:hungry/features/home/data/repo/home_repo_impl.dart';

import '../../features/auth/data/repo/auth_repo.dart';
import '../../features/card/data/repo/add_to_cart_repo/add_cart_repo.dart';
import '../../features/card/data/repo/add_to_cart_repo/add_cart_repo_impl.dart';
import '../../features/card/data/repo/get_cart_repo/get_cart_repo.dart';
import '../../features/card/data/repo/get_cart_repo/get_cart_repo_impl.dart';
import '../../features/card/data/repo/remove_cart_repo/remove_cart_repo.dart';
import '../../features/card/data/repo/remove_cart_repo/remove_cart_repo_impl.dart';
import '../../features/home/data/repo/home_repo.dart';
import '../../features/product/data/repo/toppings_oppings_impl.dart';
import '../../features/product/data/repo/toppings_oppings_repo.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<ApiServer>(() => ApiServer());

  getIt.registerLazySingleton<AuthRepo>(
        () => AuthRepoImpl(apiServer: getIt<ApiServer>()),
  );

  getIt.registerLazySingleton<HomeRepo>(
        () => HomeRepoImpl(apiServer: getIt<ApiServer>()),
  );

  getIt.registerLazySingleton<CartRepo>(
        () => CartRepoImpl(apiServer: getIt<ApiServer>()),
  );

  getIt.registerLazySingleton<GetCartRepo>(
        () => GetCartRepoImpl(apiServer: getIt<ApiServer>()),
  );

  getIt.registerLazySingleton<RemoveCartRepo>(
        () => RemoveCartImpl(apiServer: getIt<ApiServer>()),
  );

  getIt.registerLazySingleton<ToppingsAndSoppingsRepo>(
        () => ToppingsAndSoppingsRepoImpl(apiServer: getIt<ApiServer>()),
  );
}
