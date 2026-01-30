import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hungry/core/resources/style.dart';
import 'package:hungry/feachers/auth/presentation/view/widget/login/login_form.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/images.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              children: [
                Gap(100),
                SvgPicture.asset(AppImages.logo),
                Gap(10),
                Text(
                  "Welcome Back , Discover The Fast Food ",
                  style: AppStyle.text14,
                ),
                Gap(70),
                LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
