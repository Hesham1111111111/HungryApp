import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry/features/auth/presentation/view/widget/login/password_field.dart';
import 'package:hungry/root.dart';
import '../../../../../../core/widget/custom_snack_bar_error.dart';
import '../../../../manager/auth_cubit.dart';
import '../../../../manager/auth_state.dart';
import 'email_field.dart';
import 'login_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    final cubit = context.read<AuthCubit>();
    cubit.emailController.text = "Eth@gmail.com";
    cubit.passController.text = "01154912395";
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: _listener,
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            children: [
              const EmailField(),
              const Gap(20),
              const PasswordField(),
              const Gap(30),
              LoginButton(formKey: _formKey, state: state),
            ],
          ),
        );
      },
    );
  }

  void _listener(BuildContext context, AuthState state) {
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
  }
}
