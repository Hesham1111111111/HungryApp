import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/resources/app_colors.dart';
import '../../../manager/get_cart_manager/get_cart__cubit.dart';
import '../../../manager/get_cart_manager/get_cart__state.dart';
import 'cart_bottom_sheet.dart';

class BottomSheetCheckOut extends StatelessWidget {
  const BottomSheetCheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCartCubit, GetCartState>(
      builder: (context, state) {
        if (state is GetCartLoading) {
          return CupertinoActivityIndicator(color: AppColors.primary);
        }
        if (state is GetCartSuccess) {
          return CartBottomSheet(orderData: state.orders.first.data);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
