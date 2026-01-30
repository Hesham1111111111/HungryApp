import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/feachers/checkout/presentaion/views/widget/checkout_appbar.dart';
import 'package:hungry/feachers/checkout/presentaion/views/widget/checkout_bottom_sheet.dart';
import 'package:hungry/feachers/checkout/presentaion/views/widget/order_summary.dart';
import 'package:hungry/feachers/checkout/presentaion/views/widget/payment_methods_section.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key, required this.totalPrice, });
  final String totalPrice;


  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  String selected = "Cash";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CheckoutAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(31.h),
              OrderSummary(totalPrice: widget.totalPrice,),
              Gap(20.h),
              PaymentMethodsSection(
                selected: selected,
                onChanged: (value) {
                  setState(() {
                    selected = value!;
                  });
                },
              ),
              Gap(400.h),
            ],
          ),
        ),
      ),
      bottomSheet: CheckoutBottomSheet(totalPrice:widget.totalPrice ,),
    );
  }
}
