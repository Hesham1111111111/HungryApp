import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/di/service_locator.dart';

import 'package:hungry/features/auth/manager/auth_cubit.dart';
import 'package:hungry/features/card/data/repo/get_cart_repo/get_cart_repo.dart';
import 'package:hungry/features/card/data/repo/get_cart_repo/get_cart_repo_impl.dart';
import 'package:hungry/features/card/data/repo/remove_cart_repo/remove_cart_repo.dart';
import 'package:hungry/features/card/manager/get_cart_manager/get_cart__cubit.dart';
import 'package:hungry/features/card/manager/remove_cart_manager/remove_cart_cubit.dart';
import 'package:hungry/features/home/manager/categories_manager/categories_cubit.dart';
import 'package:hungry/features/home/manager/home_manger/home_cubit.dart';
import 'package:hungry/features/product/manager/side_option_manager/side_option_cubit.dart';
import 'package:hungry/features/product/manager/toppings_manager/toppings_cubit.dart';
import 'features/auth/data/repo/auth_repo.dart';
import 'features/card/data/repo/add_to_cart_repo/add_cart_repo.dart';
import 'features/card/manager/add_to_cart_manager/ad_to_cart_cubit.dart';
import 'features/home/data/repo/home_repo.dart';
import 'features/product/data/repo/toppings_oppings_repo.dart';
import 'features/splash/presentation/view/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setup();
  runApp(const HungryApp());
}

class HungryApp extends StatelessWidget {
  const HungryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (_) => AuthCubit(getIt.get<AuthRepo>()),
        ),

        BlocProvider<HomeProductCubit>(
          create: (_) =>
              HomeProductCubit(getIt.get<HomeRepo>()),
        ),

        BlocProvider<CategoriesCubit>(
          create: (_) =>
              CategoriesCubit(getIt.get<HomeRepo>())..getCategories(),
        ),

        BlocProvider<ToppingsCubit>(
          create: (_) =>
              ToppingsCubit(getIt.get<ToppingsAndSoppingsRepo>())
                ..getToppings(),
        ),

        BlocProvider<SideOptionsCubit>(
          create: (_) =>
              SideOptionsCubit(getIt.get<ToppingsAndSoppingsRepo>())
                ..getSideOptions(),
        ),

        BlocProvider<GetCartCubit>(
          create: (_) => GetCartCubit(getIt.get<GetCartRepo>())..getCart(),
        ),

        BlocProvider<AddToCartCubit>(
          create: (_) => AddToCartCubit(getIt.get<CartRepo>()),
        ),

        BlocProvider<RemoveCartCubit>(
          create: (_) => RemoveCartCubit(getIt.get<RemoveCartRepo>()),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(scaffoldBackgroundColor: Colors.white),
          title: "Hungry App",
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
