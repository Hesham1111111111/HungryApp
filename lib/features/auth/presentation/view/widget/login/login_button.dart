import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/resources/app_colors.dart';
import '../../../../../../core/widget/custom_auth_Btn.dart';
import '../../../../manager/auth_cubit.dart';
import '../../../../manager/auth_state.dart';

class LoginButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final AuthState state;

  const LoginButton({
    required this.formKey,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();

    if (state is AuthLoading) {
      return const CupertinoActivityIndicator(
        color: AppColors.primary,
      );
    }

    return CustomAuthBtn(
      gradient: const LinearGradient(
        colors: [AppColors.green, AppColors.primary],
      ),
      text: 'Login',
      onTap: () {
        if (formKey.currentState!.validate()) {
          cubit.login();
        }
      },
    );
  }
}
