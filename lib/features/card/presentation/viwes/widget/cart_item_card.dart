import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gap/flutter_gap.dart';
import '../../../data/model/get_cart_model/order_Item.dart';
import '../../../manager/remove_cart_manager/remove_cart_cubit.dart';
import '../../../manager/get_cart_manager/get_cart__cubit.dart';
import '../../../../../core/widget/custom_button.dart';
import '../../../manager/remove_cart_manager/remove_cart_state.dart';
import 'product_info.dart';
import 'quantity_controller.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({super.key, required this.orderItem});

  final OrderItem orderItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 11.w),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
          side: BorderSide(color: Colors.black12, width: 1.w),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProductInfo(orderItem: orderItem),
              Column(
                children: [
                  Gap(10),
                  QuantityController(),
                  Gap(20),
                  BlocBuilder<RemoveCartCubit, RemoveCartState>(
                    builder: (context, state) {
                      final isLoading =
                          state is RemoveCartLoading &&
                          state.itemId == orderItem.itemId;

                      return InkWell(
                        onTap: isLoading
                            ? null
                            : () async {
                                await context
                                    .read<RemoveCartCubit>()
                                    .removeItem(orderItem.itemId);

                                context.read<GetCartCubit>().getCart();
                              },
                        child: CustomButton(
                          text: isLoading ? "Removing..." : "Remove",
                          width: 154,
                          height: 43,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
