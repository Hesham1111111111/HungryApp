import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/resources/images.dart';
import 'package:hungry/core/widget/custom_button.dart';
import '../../../../core/resources/style.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) => Card(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(AppImages.testImage3),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Hamburger Hamburger ", style: AppStyle.bold),
                          Text("Qty : X3"),
                          Text("Price : 54\$", style: AppStyle.bold),
                        ],
                      ),
                      Gap(20.w),
                    ],
                  ),
                  Gap(20.h),
                  CustomButton(
                    text: "Order Again  ",
                    color: Colors.grey.shade400,
                    width: double.infinity,
                    height: 55.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
