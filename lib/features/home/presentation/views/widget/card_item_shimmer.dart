import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:shimmer/shimmer.dart';

class CardItemShimmer extends StatelessWidget {
  const CardItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 155.h,
              color: Colors.white,
            ),
            Gap(10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                children: [
                  Container(height: 20.h, width: double.infinity, color: Colors.white),
                  Gap(5.h),
                  Container(height: 15.h, width: 100.w, color: Colors.white),
                ],
              ),
            ),
            Gap(10.h),
            Padding(
              padding: EdgeInsets.all(8.w),
              child: Row(
                children: [
                  Container(height: 20.h, width: 20.w, color: Colors.white),
                  Gap(5.w),
                  Container(height: 15.h, width: 50.w, color: Colors.white),
                  const Spacer(),
                  Container(height: 20.h, width: 20.w, color: Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
