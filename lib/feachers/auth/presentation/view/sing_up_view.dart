import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hungry/core/resources/app_colors.dart';
import 'package:hungry/core/resources/images.dart';
import 'package:hungry/core/resources/style.dart';
import 'package:hungry/feachers/auth/presentation/view/widget/singup/sing_up_form.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          children: [
            Gap(100),
            SvgPicture.asset(AppImages.logo,color: Colors.white,),
            Text("Welcome To our food App ",style: AppStyle.text14.copyWith(color: Colors.white),),
            Gap(80),
            SignUpForm(),
          ],
        ),
      ),
    );
  }
}
