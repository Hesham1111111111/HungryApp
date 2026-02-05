import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/features/card/data/model/get_cart_model/order_data_model.dart';
import 'package:hungry/features/checkout/presentaion/views/checkout_view.dart';
import '../../../../../core/resources/style.dart';
import '../../../../../core/widget/custom_button.dart';

class CartBottomSheet extends StatelessWidget {
  const CartBottomSheet({super.key, required this.orderData });
final  List<OrderData> orderData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8.r,
            offset: Offset(0, -2.h),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Total", style: AppStyle.text18),
              Gap(5.h),
              Text("\$ ${orderData.first.totalPrice}", style: AppStyle.text18),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CheckoutView(totalPrice: orderData.first.totalPrice, )),
              );
            },
            child: CustomButton(text: 'Checkout', width: 200.w, height: 70.h),
          ),
        ],
      ),
    );
  }
}
