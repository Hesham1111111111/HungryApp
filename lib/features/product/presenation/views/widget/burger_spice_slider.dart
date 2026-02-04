import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/app_colors.dart';
import '../../../../../core/resources/images.dart';

class BurgerSpiceSlider extends StatelessWidget {
  const BurgerSpiceSlider({
    super.key,
    required this.value,
    required this.onchange,
  });

  final double value;

  final ValueChanged<double> onchange;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 99.w,
          height: 150.h,
          decoration: BoxDecoration(

            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(AppImages.details)),
          ),
        ),

        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 190.w,
              child: Text(
                "Customize Your Burger\n to Your Tastes. Ultimate\n Experience",
                style: TextStyle(fontSize: 16.sp),
              ),
            ),
            Slider(
              value: value,
              onChanged: onchange,
              max: 1,
              min: 0,
              inactiveColor: Colors.green.shade300,
              activeColor: AppColors.primary,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("🥶", style: TextStyle(fontSize: 18.sp)),
                SizedBox(width: 100.w),
                Text("🌶️", style: TextStyle(fontSize: 18.sp)),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
