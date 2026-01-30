import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/feachers/home/manager/home_manger/home_cubit.dart';
import 'package:hungry/feachers/home/manager/home_manger/home_state.dart';
import 'card_item.dart';

class GridViewItem extends StatelessWidget {
  const GridViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeProductCubit, HomeProductState>(
      builder: (context, state) {
        if (state is LoadingHomeProductState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is SuccessHomeProductState) {
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 10.h,
              childAspectRatio: 0.71,
            ),
            itemBuilder: (context, index) {
              return CardItem(product: state.products[index]);
            },
          );
        }

        if (state is ErrorHomeProductState) {
          print(state.errorMessage);
          return Center(
            child: Text(state.errorMessage, style: const TextStyle(color: Colors.red)),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
