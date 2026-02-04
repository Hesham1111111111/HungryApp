import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/style.dart';
import 'checkout_text.dart';

class OrderSummary extends StatelessWidget {
  OrderSummary({super.key, required this.totalPrice,});

  final String totalPrice;


  @override
  Widget build(BuildContext context) {
    double taxes = 1.13;
    double delivery = 10.5;
    double price = double.parse(totalPrice) ?? 0.0;
   final double total = price + taxes + delivery;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Order summary", style: AppStyle.text20.copyWith(fontSize: 20.sp)),
        Gap(20.h),
        CheckoutText(text: 'Order', price: '\$ $totalPrice', isBold: false),
        Gap(10.h),
        CheckoutText(text: 'Taxes', price: '\$ $taxes', isBold: false),
        Gap(10.h),
        CheckoutText(
          text: 'Delivery fees',
          price: '\$ $delivery',
          isBold: false,
        ),
        const Divider(),
        Gap(24.h),
        CheckoutText(
          text: 'Total:',
          price: '\$ ${total}',
          isBold: true,
        ),
        Gap(20.h),
        CheckoutText(
          text: 'Estimated delivery time::',
          price: '15 - 30 mins',
          isBold: true,
        ),
        Gap(67.h),
        Text(
          "Payment methods",
          style: AppStyle.text20.copyWith(fontSize: 20.sp),
        ),
      ],
    );
  }
}
