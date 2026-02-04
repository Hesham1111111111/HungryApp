import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/core/resources/app_colors.dart';
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
              SnackBar(
                content: Row(
                  children: const [
                    Icon(Icons.check_circle, color: Colors.white),
                    SizedBox(width: 10),
                    Text("Item removed successfully"),
                  ],
                ),
                backgroundColor: AppColors.primary,
                duration: Duration(seconds: 2),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
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
