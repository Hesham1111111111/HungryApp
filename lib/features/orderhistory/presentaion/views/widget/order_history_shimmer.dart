import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hungry/core/resources/images.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/resources/style.dart';
import '../../../../../core/widget/custom_button.dart';
import '../../../../checkout/presentaion/views/checkout_view.dart';

class OrderHistoryShimmer extends StatelessWidget {
  const OrderHistoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      gradient: LinearGradient(
        colors: [Colors.grey[300]!, Colors.grey[100]!, Colors.grey[300]!],
        stops: [0.1, 0.5, 0.9],
        begin: Alignment(-1.0, -0.3),
        end: Alignment(1.0, 0.3),
        tileMode: TileMode.clamp,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(AppImages.imageSplash, width: 100.w, height: 100.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "           ",
                    style: AppStyle.bold,
                  ),
                  Text(" "),
                  Text("Price ", style: AppStyle.bold),
                ],
              ),
              Gap(20.w),
            ],
          ),
          Gap(20.h),
          InkWell(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => CheckoutView(totalPrice: "")),
              );
            },
            child: CustomButton(
              text: "Order Again  ",
              color: Colors.grey.shade400,
              width: double.infinity,
              height: 55.h,
            ),
          ),
        ],
      ),
    );
  }
}
