import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/features/auth/data/model/user_model.dart';

import '../../../../../core/resources/app_colors.dart';
import '../../../../../core/resources/images.dart';
import '../../../../../core/resources/style.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.userModel});

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(30.h),
            SvgPicture.asset(
              AppImages.logo,
              color: AppColors.primary,
              height: 35.h,
            ),
            Gap(5.h),
            Text('Hello , ${userModel.name}', style: AppStyle.text16),
          ],
        ),
        Spacer(),
        CircleAvatar(
          backgroundColor: AppColors.primary,
          radius: 35.r,
          child: ClipOval(
            child: Image.network(
              userModel.image,
              width: 70.r,
              height: 70.r,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) {
                return const Icon(
                  CupertinoIcons.person,
                  color: Colors.white,
                );
              },
            ),
          ),
        ),

      ],
    );
  }
}
