import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../manager/home_manger/home_cubit.dart';
import '../../../manager/home_manger/home_state.dart';
import 'card_item.dart';
import 'card_item_shimmer.dart';

class HomeBuilder extends StatelessWidget {
  const HomeBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeProductCubit, HomeProductState>(
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
    );
  }
}
