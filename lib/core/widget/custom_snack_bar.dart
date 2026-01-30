import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

SnackBar customSnackBar(String massage) {
  return SnackBar(
    elevation: 10,
    clipBehavior: Clip.none,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.red.shade900,
    content: Row(
      children: [
        Icon(
          Icons.info_outline,
          color: Colors.white,
          size: 20.sp,
        ),
        Gap(8.w),
        Text(
          massage,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
