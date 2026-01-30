import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry/core/resources/app_colors.dart';
import 'package:hungry/feachers/auth/manager/auth_cubit.dart';
import 'package:hungry/feachers/auth/presentation/view/login_view.dart';
import 'package:hungry/root.dart';
import '../../../../../../core/widget/custom_auth_Btn.dart';
import '../../../../../../core/widget/custom_snack_bar.dart';
import '../../../../../../core/widget/custom_textfield.dart';
import '../../../../manager/auth_state.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(customSnackBar(state.errorMessage));
          }

          if (state is AuthSuccess) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => Root()),
                  (route) => false,
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<AuthCubit>();

          return Form(
            key: cubit.signUpKey,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  const Gap(65),

                  CustomTextField(
                    hint: "Name",
                    controller: cubit.nameController,
                    isPassword: false,
                  ),

                  const Gap(20),

                  CustomTextField(
                    iconData: Icons.email,
                    hint: "Email Address",
                    controller: cubit.emailController,
                    isPassword: false,
                  ),

                  const Gap(20),

                  CustomTextField(
                    hint: "Password",
                    controller: cubit.passController,
                    isPassword: true,
                  ),

                  const Gap(30),

                  state is AuthLoading
                      ? const CupertinoActivityIndicator()
                      : CustomAuthBtn(
                    textcolor: Colors.white,
                    color: AppColors.primary,
                    text: "Sign Up",
                    onTap: () {
                      cubit.signUp();
                    },
                  ),

                  const Gap(20),

                  CustomAuthBtn(
                    color: AppColors.primary,
                    text: "Go to Login ?",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => LoginView()),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
