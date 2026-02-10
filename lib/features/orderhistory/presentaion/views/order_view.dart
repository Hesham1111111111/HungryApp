import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/resources/images.dart';
import 'package:hungry/core/widget/custom_button.dart';
import 'package:hungry/features/card/manager/get_cart_manager/get_cart__cubit.dart';
import 'package:hungry/features/card/manager/get_cart_manager/get_cart__state.dart';
import 'package:hungry/features/orderhistory/presentaion/views/widget/order_historsy_data.dart';
import 'package:hungry/features/orderhistory/presentaion/views/widget/order_history_shimmer.dart';
import '../../../../core/resources/style.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: BlocBuilder<GetCartCubit, GetCartState>(
          builder: (context, state) {
            if (state is GetCartLoading) {
              return OrderHistoryShimmer();
            } else if (state is GetCartSuccess) {
              return ListView.builder(
                itemCount: state.orders.length,
                itemBuilder: (context, index) => Card(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 20.h,
                    ),
                    child: OrderHistoryData(
                      orderData: state.orders[index].data,
                      totalPrice: state.orders[index].data.first.totalPrice, // صححت هنا
                    ),
                  ),
                ),
              );
            } else if (state is GetCartError) {
              return Center(child: Text(state.error));
            } else {
              return SizedBox();
            }
          },
        )

      ),
    );
  }
}
