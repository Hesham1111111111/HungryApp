import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/features/auth/presentation/view/widget/singup/sing_up_form.dart';
class SignUpCard extends StatelessWidget {
  final Animation<Offset> slideAnimation;
  final Animation<double> fadeAnimation;

  const SignUpCard({super.key, required this.slideAnimation, required this.fadeAnimation});

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: slideAnimation,
      child: FadeTransition(
        opacity: fadeAnimation,
        child: Container(
          padding: const EdgeInsets.all(25),
          margin:  EdgeInsets.symmetric(horizontal: 20.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.r),
            boxShadow:  [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 15.r,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: const SignUpForm(),
        ),
      ),
    );
  }
}