import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/features/card/presentation/viwes/widget/bottom_sheet_check_out.dart';
import 'package:hungry/features/card/presentation/viwes/widget/cart_item_list.dart';

import '../../../core/widget/custom_snack_bar_success.dart';
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
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(snackBarSuccess("Item removed successfully"));
          }
        },
        child: const CartItemList(),
      ),
      bottomSheet: BottomSheetCheckOut(),
    );
  }
}
