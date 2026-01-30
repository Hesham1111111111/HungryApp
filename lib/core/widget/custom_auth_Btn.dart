import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../resources/style.dart';

class CustomAuthBtn extends StatelessWidget {
  CustomAuthBtn({
    super.key,
    this.onTap,
    required this.text,
    this.color,
    this.textcolor,
  });

  final Function()? onTap;
  final String text;
  final Color? textcolor;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 55.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.r),
          color: color ?? Colors.white,
        ),
        child: Center(
          child: Text(
            text,
            style: text == "Login"
                ? TextStyle(
              color: Colors.black87,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            )
                : AppStyle.text17.copyWith(
              color: Colors.white,
              fontSize: 17.sp,
            ),
          ),
        ),
      ),
    );
  }
}
