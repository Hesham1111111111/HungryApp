import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/feachers/card/manager/add_to_cart_manager/add_to_curt_state.dart';
import 'package:hungry/feachers/card/manager/get_cart_manager/get_cart__cubit.dart';
import 'package:hungry/feachers/card/manager/get_cart_manager/get_cart__state.dart';
import 'package:hungry/feachers/card/presentation/viwes/widget/cart_bottom_sheet.dart';
import 'package:hungry/feachers/card/presentation/viwes/widget/cart_item_list.dart';
import '../manager/remove_cart_manager/remove_cart_cubit.dart';
import '../manager/remove_cart_manager/remove_cart_state.dart';

class CardView extends StatelessWidget {
  const CardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<RemoveCartCubit, RemoveCartState>(
        listener: (context, state) {
          if (state is RemoveCartSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Item removed successfully")),
            );
          } else if (state is RemoveCartError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        child: const CartItemList(),
      ),
      bottomSheet: BlocBuilder<GetCartCubit, GetCartState>(
        builder: (context, state) {
          if (state is GetCartLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          else if (state is GetCartSuccess) {
            return CartBottomSheet(orderData: state.orders.first.data ,
            );
          }
          else {
            return const SizedBox.shrink();
          }
        },
      ),

    );
  }
}
