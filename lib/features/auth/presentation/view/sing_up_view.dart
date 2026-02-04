import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry/core/resources/app_colors.dart';
import 'package:hungry/core/resources/images.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hungry/features/auth/presentation/view/widget/background.dart';
import 'package:hungry/features/auth/presentation/view/widget/singup/sign_up_card.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> slideAnimation;
  late Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            BackgroundColor(),
            Center(
              child: Column(
                children: [
                  const Gap(100),
                  SvgPicture.asset(AppImages.logo, color: Colors.white),
                  Text(
                    "Welcome To our food App",
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  const Gap(50),
                  SignUpCard(
                    slideAnimation: slideAnimation,
                    fadeAnimation: fadeAnimation,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
