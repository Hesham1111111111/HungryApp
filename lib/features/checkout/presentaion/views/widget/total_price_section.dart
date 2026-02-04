import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resources/style.dart';
import '../../../../../core/widget/custom_button.dart';

class TotalPriceSection extends StatelessWidget {
  const TotalPriceSection({super.key, required this.totalPrice});

  final String totalPrice;

  double getTotalPrice() {
    final price = double.tryParse(totalPrice) ?? 0.0;
    return price + 1.13 + 10.5;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text("Total price", style: AppStyle.text15),
              Gap(4.h),
              Text(
                "\$ ${getTotalPrice().toStringAsFixed(2)}",
                style: AppStyle.text18,
              ),
            ],
          ),
          InkWell(
              onTap: (){

              },
              child: CustomButton(text: "Pay Now", width: 209.w, height: 70.h)),
        ],
      ),
    );
  }
}
