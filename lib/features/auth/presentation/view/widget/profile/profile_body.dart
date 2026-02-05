import 'package:flutter/material.dart';
import 'package:hungry/features/auth/presentation/view/widget/profile/profile_content.dart';
import 'package:hungry/features/auth/presentation/view/widget/profile/profile_heder.dart';

import '../../../../manager/auth_cubit.dart';

class ProfileBody extends StatelessWidget {
  final AuthCubit authCubit;
  final String? selectedImage;
  final Function(String) onPickImage;

  const ProfileBody({
    super.key,
    required this.authCubit,
    required this.selectedImage,
    required this.onPickImage,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const ProfileHeader(),
         ProfileContent(
          authCubit: authCubit,
          selectedImage: selectedImage,
          onPickImage: onPickImage,
        ),
      ],
    );
  }
}
