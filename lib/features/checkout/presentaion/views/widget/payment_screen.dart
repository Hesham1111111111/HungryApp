import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resources/app_colors.dart';
import '../../../../../core/resources/style.dart';
import '../../../../../core/widget/custom_button.dart';
import '../../../../../root.dart';

class PaymentSuccessScreen extends StatelessWidget {

  const PaymentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Hero(
          tag: "pay_now_button",
          child: Container(
            width: 300.w,
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.r,
                  offset: Offset(0, 5.h),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 60.w,
                  height: 60.w,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.check, color: Colors.white, size: 40.w),
                ),
                SizedBox(height: 15.h),
                Text("Success !", style: AppStyle.text30),
                SizedBox(height: 10.h),
                Text(
                  "Your payment was successful.\nOrder ID: ",
                  textAlign: TextAlign.center,
                  style: AppStyle.text16,
                ),
                SizedBox(height: 20.h),
                InkWell(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => Root()),
                          (route) => false,
                    );
                  },
                  child: CustomButton(
                    text: "Go Back",
                    width: double.infinity,
                    height: 50.h,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
