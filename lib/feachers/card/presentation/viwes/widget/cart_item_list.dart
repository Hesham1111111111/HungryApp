import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/feachers/card/manager/get_cart_manager/get_cart__cubit.dart';
import 'package:hungry/feachers/card/manager/get_cart_manager/get_cart__state.dart';
import 'cart_item_card.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCartCubit, GetCartState>(
      builder: (context, state) {
        if (state is GetCartLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is GetCartSuccess) {
          final order = state.orders.first;
          final items = order.data.first.item;
          return Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return CartItemCard(orderItem: item);
              },
            ),
          );
        }

        else if (state is GetCartError) {
          return Center(child: Text(state.error));
        } else {
          return const Center(child: Text("Unknown Error"));
        }
      },
    );
  }
}
