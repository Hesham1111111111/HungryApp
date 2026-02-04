import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/widget/custom_textfield.dart';
import '../../../../manager/auth_cubit.dart';

class EmailField extends StatelessWidget {
  const EmailField();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();

    return CustomTextField(
      iconData: Icons.email,
      hint: "Email Address",
      controller: cubit.emailController,
      isPassword: false,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Email is required';
        }
        return null;
      },
    );
  }
}
