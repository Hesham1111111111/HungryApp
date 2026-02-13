import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry/core/resources/app_colors.dart';
import 'package:hungry/root.dart';
import '../../../../../../core/widget/custom_auth_Btn.dart';
import '../../../../../../core/widget/custom_snack_bar_error.dart';
import '../../../../../../core/widget/custom_textfield.dart';
import '../../../../manager/auth_cubit.dart';
import '../../../../manager/auth_state.dart';
import '../../login_view.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(customSnackBarError(state.errorMessage));
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

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Gap(65),

                  CustomTextField(
                    hint: "Name",
                    controller: cubit.nameController,
                    isPassword: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Name is required';
                      }
                      return null;
                    },
                  ),

                  const Gap(20),

                  CustomTextField(
                    iconData: Icons.email,
                    hint: "Email Address",
                    controller: cubit.emailController,
                    isPassword: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      }
                      if (!value.contains('@')) return 'Enter a valid email';
                      return null;
                    },
                  ),

                  const Gap(20),

                  CustomTextField(
                    hint: "Password",
                    controller: cubit.passController,
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      }
                      if (value.length < 6) return 'Minimum 6 characters';
                      return null;
                    },
                  ),

                  const Gap(30),

                  state is AuthLoading
                      ? const CupertinoActivityIndicator(color: AppColors.primary,)
                      : CustomAuthBtn(
                          text: "Sign Up",
                          textColor: Colors.white,
                          gradient: const LinearGradient(
                            colors: [Color(0xff0A5A28), AppColors.primary],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              cubit.signUp();
                            }
                          },
                        ),

                  const Gap(20),

                  CustomAuthBtn(
                    textColor: AppColors.primary,
                    color: Colors.white,
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
          ),
        );
      },
    );
  }
}
