import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hungry/feachers/auth/manager/auth_cubit.dart';
import 'package:hungry/feachers/card/manager/get_cart_manager/get_cart__cubit.dart';
import 'package:hungry/feachers/card/manager/remove_cart_manager/remove_cart_cubit.dart';
import 'package:hungry/feachers/home/manager/categories_manager/categories_cubit.dart';
import 'package:hungry/feachers/home/manager/home_manger/home_cubit.dart';
import 'package:hungry/feachers/product/manager/side_option_manager/side_option_cubit.dart';
import 'package:hungry/feachers/product/manager/toppings_manager/toppings_cubit.dart';
import 'feachers/card/data/repo/add_to_cart_repo/add_cart_repo_impl.dart';
import 'feachers/card/data/repo/remove_cart_repo/remove_cart_repo_impl.dart';
import 'feachers/card/manager/add_to_cart_manager/ad_to_cart_cubit.dart';
import 'feachers/splsh/presntaion/view/splash_scree n.dart';

void main() {
  runApp(const HungryApp());
}

class HungryApp extends StatelessWidget {
  const HungryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (_) => AuthCubit()),

        BlocProvider<HomeProductCubit>(
          create: (_) => HomeProductCubit()..getHomeProduct(),
        ),

        BlocProvider<CategoriesCubit>(
          create: (_) => CategoriesCubit()..getCategories(),
        ),

        BlocProvider<ToppingsCubit>(
          create: (_) => ToppingsCubit()..getToppings(),
        ),

        BlocProvider<SideOptionsCubit>(
          create: (_) => SideOptionsCubit()..getSideOptions(),
        ),

        BlocProvider<GetCartCubit>(create: (_) => GetCartCubit()..getCart()),

        BlocProvider<CartCubit>(create: (_) => CartCubit(CartRepoImpl())),


        BlocProvider<RemoveCartCubit>(
          create: (_) => RemoveCartCubit(RemoveCartImpl()),
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
