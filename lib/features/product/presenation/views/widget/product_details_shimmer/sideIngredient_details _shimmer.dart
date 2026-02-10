import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class SideIngredientTileShimmer extends StatelessWidget {
  const SideIngredientTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          height: 120.h,
          width: 100.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22.r),
          ),
          child: Column(
            children: [
              /// Image shimmer
              ClipRRect(
                borderRadius:
                BorderRadius.vertical(top: Radius.circular(22.r)),
                child: Container(
                  height: 70.h,
                  width: double.infinity,
                  color: Colors.white,
                ),
              ),

              /// Bottom shimmer
              Expanded(
                child: Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(22.r),
                    ),
                  ),
                  child: Row(
                    children: [
                      /// Text shimmer
                      Expanded(
                        child: Container(
                          height: 12.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                        ),
                      ),

                      SizedBox(width: 8.w),

                      /// Circle icon shimmer
                      Container(
                        width: 22.w,
                        height: 22.h,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
