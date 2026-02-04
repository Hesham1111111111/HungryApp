import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/resources/style.dart';

class CheckoutText extends StatelessWidget {
  CheckoutText({
    super.key,
    this.color,
    required this.text,
    required this.price,
    required this.isBold,
  });

  final String text;
  final String price;
  final bool isBold;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: isBold
              ? AppStyle.text15.copyWith(
            fontWeight: FontWeight.bold,
            color: color ?? Colors.black,
            fontSize: 18.sp,
          )
              : AppStyle.text15,
        ),
        Text(
          price,
          style: isBold
              ? AppStyle.text15.copyWith(
            fontWeight: FontWeight.bold,
            color: color ?? Colors.black,
            fontSize: 18.sp,
          )
              : AppStyle.text15,
        ),
      ],
    );
  }
}
