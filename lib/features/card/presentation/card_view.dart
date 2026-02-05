import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/features/card/manager/get_cart_manager/get_cart__cubit.dart';
import 'package:hungry/features/card/manager/get_cart_manager/get_cart__state.dart';
import 'package:hungry/features/card/presentation/viwes/widget/cart_bottom_sheet.dart';
import 'package:hungry/features/card/presentation/viwes/widget/cart_item_list.dart';
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
              SnackBar(content: Text("Item removed successfully")),
            );
          }
        },
        child: const CartItemList(),
      ),
      bottomSheet: BlocBuilder<GetCartCubit, GetCartState>(
        builder: (context, state) {
          if (state is GetCartLoading) {
            return const CircularProgressIndicator();
          }
          if (state is GetCartSuccess) {
            return CartBottomSheet(orderData: state.orders.first.data);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
