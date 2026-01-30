import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hungry/feachers/auth/manager/auth_cubit.dart';
import 'package:hungry/feachers/auth/manager/auth_state.dart';
import 'package:hungry/feachers/home/manager/home_manger/home_cubit.dart';
import 'package:hungry/feachers/home/manager/home_manger/home_state.dart';
import 'package:hungry/feachers/home/presentation/views/widget/card_item.dart';
import 'package:hungry/feachers/home/presentation/views/widget/catogery_item.dart';
import 'package:hungry/feachers/home/presentation/views/widget/header_row.dart';
import 'package:hungry/feachers/home/presentation/views/widget/search.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            /// 🔹 APP BAR
            SliverAppBar(
              scrolledUnderElevation: 0,
              elevation: 0,
              pinned: true,
              backgroundColor: Colors.white,
              toolbarHeight: 180.h,
              automaticallyImplyLeading: false,
              flexibleSpace: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                child: BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    if (state is AuthSuccess) {
                      return Column(
                        children: [
                          Header(userModel: state.user),
                          Gap(12.h),
                          const Search(),
                        ],
                      );
                    }

                    if (state is AuthError) {
                      return Text(
                        state.errorMessage,
                        style: const TextStyle(color: Colors.red),
                      );
                    }

                    return const SizedBox(height: 80);
                  },
                ),
              ),
            ),

            /// 🔹 CATEGORIES
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    CategoryItem(),
                    Gap(20.h),
                  ],
                ),
              ),
            ),

            /// 🔹 PRODUCTS GRID
            BlocBuilder<HomeProductCubit, HomeProductState>(
              builder: (context, state) {
                if (state is LoadingHomeProductState) {
                  return const SliverToBoxAdapter(
                    child: Center(child: CircularProgressIndicator()),
                  );
                }

                if (state is SuccessHomeProductState) {
                  if (state.products.isEmpty) {
                    return const SliverToBoxAdapter(
                      child: Center(child: Text('No products found')),
                    );
                  }

                  return SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                            (context, index) {
                          return CardItem(
                            product: state.products[index],
                          );
                        },
                        childCount: state.products.length,
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.w,
                        mainAxisSpacing: 10.h,
                        childAspectRatio: 0.72,
                      ),
                    ),
                  );
                }

                if (state is ErrorHomeProductState) {
                  return SliverToBoxAdapter(
                    child: Center(
                      child: Text(
                        state.errorMessage,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  );
                }

                return const SliverToBoxAdapter(child: SizedBox.shrink());
              },
            ),
          ],
        ),
      ),
    );
  }
}
