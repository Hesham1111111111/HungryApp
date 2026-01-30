import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resources/app_colors.dart';
import '../../../../../core/resources/style.dart';

class QuantityController extends StatefulWidget {
  const QuantityController({super.key});

  @override
  State<QuantityController> createState() => _QuantityControllerState();
}

class _QuantityControllerState extends State<QuantityController> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Container(
            height: 43.h,
            width: 39.w,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: InkWell(
              onTap: () {
                if (index > 0) {
                  setState(() => index--);
                }
              },
              child: Icon(Icons.remove, color: Colors.white, size: 30.sp),
            ),
          ),
          Gap(15.w),
          Text(index.toString(), style: AppStyle.text18),
          Gap(15.w),
          Container(
            height: 43.h,
            width: 39.w,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: InkWell(
              onTap: () => setState(() => index++),
              child: Icon(CupertinoIcons.add, color: Colors.white, size: 30.sp),
            ),
          ),
        ],
      ),
    );
  }
}
