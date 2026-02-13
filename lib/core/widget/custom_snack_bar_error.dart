import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

SnackBar customSnackBarError(String massage) {
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            massage,
            maxLines: 1,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}
