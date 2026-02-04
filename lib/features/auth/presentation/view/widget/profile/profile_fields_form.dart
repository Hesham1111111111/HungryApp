import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../manager/auth_cubit.dart';
import 'custom_profile_filed.dart';

class ProfileFieldsForm extends StatelessWidget {
  const ProfileFieldsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();

    return Column(
      children: [
        CustomProfileText(label: 'Name', controller: cubit.nameController),
        const SizedBox(height: 25),
        CustomProfileText(label: 'Email', controller: cubit.emailController),
        const SizedBox(height: 25),
        CustomProfileText(label: 'Delivery Address', controller: cubit.addressController),
        const SizedBox(height: 25),
        Divider(color: Colors.grey[400]),
        const SizedBox(height: 25),
      ],
    );
  }
}
