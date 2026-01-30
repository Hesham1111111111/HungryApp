import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry/feachers/auth/manager/auth_cubit.dart';
import 'package:hungry/feachers/home/presentation/views/home_view.dart';
import 'package:hungry/root.dart';

import '../../../../../../core/widget/custom_auth_Btn.dart';
import '../../../../../../core/widget/custom_snack_bar.dart';
import '../../../../../../core/widget/custom_textfield.dart';
import '../../../../manager/auth_state.dart';
import '../../sing_up_view.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
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
        cubit.emailController.text="Eth@gmail.com";
        cubit.passController.text="01154912395";


        return Form(

          key: cubit.loginKey,
          child: Column(
            children: [
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
                color: Colors.white,
                text: 'Login',
                onTap: () {
                  cubit.login();
                },
              ),

              const Gap(10),

              CustomAuthBtn(
                color: Colors.black54,
                text: 'Go TO Sing Up ',

                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => SignUpView()),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
