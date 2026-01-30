import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/app_colors.dart';
import '../resources/style.dart';

class CustomButton extends StatelessWidget {
   CustomButton({
    super.key,
    required this.text,

    required this.width,
    required this.height,
    this.color,
    this.onTap,
    this.text2,
    this.isLoading,
  });

  final String text;
  final String? text2;
  final double width;
  final double height;
  final Color? color;
  final Function? onTap;
  bool? isLoading;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(25.r)),
      child: Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(color: color ?? AppColors.primary),
        child: Center(
          child: Text(text, style: AppStyle.text2_18.copyWith(fontSize: 18.sp)),
        ),
      ),
    );
  }
}
