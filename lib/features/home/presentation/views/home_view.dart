import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/features/auth/manager/auth_cubit.dart';
import 'package:hungry/features/auth/manager/auth_state.dart';
import 'package:hungry/features/home/manager/home_manger/home_cubit.dart';
import 'package:hungry/features/home/manager/home_manger/home_state.dart';
import 'package:hungry/features/home/presentation/views/widget/card_item.dart';
import 'package:hungry/features/home/presentation/views/widget/card_item_shimmer.dart';
import 'package:hungry/features/home/presentation/views/widget/catogery_item.dart';
import 'package:hungry/features/home/presentation/views/widget/header_row.dart';
import 'package:hungry/features/home/presentation/views/widget/header_shimmer.dart';
import 'package:hungry/features/home/presentation/views/widget/search.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();

    context.read<HomeProductCubit>().getHomeProduct();
    context.read<AuthCubit>().getProfileData();
  }
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              scrolledUnderElevation: 0,
              elevation: 0,
              pinned: true,
              backgroundColor: Colors.white,
              toolbarHeight: 180.h,
              automaticallyImplyLeading: false,
              flexibleSpace: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                child: Column(
                  children: [
                    BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, state) {
                        if (state is AuthLoading) {
                          return const HeaderShimmer();
                        }
                        if (state is AuthSuccess) {
                          return Header(userModel: state.user);
                        }
                        if (state is AuthError) {
                          return Text(state.errorMessage);
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                    Gap(12.h),
                    Search(),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(children: [CategoryItem(), Gap(20.h)]),
              ),
            ),
            BlocBuilder<HomeProductCubit, HomeProductState>(
              builder: (context, state) {
                if (state is LoadingHomeProductState) {
                  return SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                            (context, index) => const CardItemShimmer(),
                        childCount: 6,
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

                if (state is SuccessHomeProductState) {
                  return SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return CardItem(product: state.products[index]);
                      }, childCount: state.products.length),
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
