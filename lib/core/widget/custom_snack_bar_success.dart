import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/app_colors.dart';

SnackBar snackBarSuccess(String massage) {
  return SnackBar(
    content: Row(
      children:  [
        Icon(Icons.check_circle, color: Colors.white),
        SizedBox(width: 10.w),
        Text(massage, style: TextStyle(
          color: Colors.white,
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),),
      ],
    ),
    backgroundColor: AppColors.primary,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.sp)),
  );
}
