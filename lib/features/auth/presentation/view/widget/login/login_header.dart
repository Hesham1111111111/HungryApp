import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/resources/images.dart';
import '../../../../../../core/resources/style.dart';


class LoginHeader extends StatelessWidget {
  const LoginHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          AppImages.logo,
          height: 100,
          color: Colors.white,
        ),
        const Gap(20),
        Text(
          "Welcome Back!",
          style: AppStyle.text24.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Gap(10),
        Text(
          "Discover The Fast Food",
          style: AppStyle.text16.copyWith(color: Colors.white70),
        ),
      ],
    );
  }
}
