import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry/features/auth/presentation/view/widget/login/sign_up_link.dart';
import 'login_card.dart';
import 'login_header.dart';
class LoginContent extends StatelessWidget {
  const LoginContent();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedPadding(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                Gap(60),
                LoginHeader(),
                Gap(50),
                LoginCard(),
                Gap(20),
                SignUpLink(),
                Gap(30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
