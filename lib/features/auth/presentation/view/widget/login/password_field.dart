import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/widget/custom_textfield.dart';
import '../../../../manager/auth_cubit.dart';
class PasswordField extends StatelessWidget {
  const PasswordField();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();

    return CustomTextField(
      iconData: Icons.lock,
      hint: "Password",
      controller: cubit.passController,
      isPassword: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password is required';
        }
        return null;
      },
    );
  }
}
