import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/resources/app_colors.dart';
import '../../../../../../core/resources/images.dart';
import '../../../../manager/auth_cubit.dart';
import '../../../../manager/auth_state.dart';

class ProfileImagePicker extends StatelessWidget {
  final String? imagePath;
  final VoidCallback onPickImage;

  const ProfileImagePicker({
    super.key,
    required this.imagePath,
    required this.onPickImage,
  });

  @override
  Widget build(BuildContext context) {
    ImageProvider profileImage;

    if (imagePath != null) {
      profileImage = FileImage(File(imagePath!));
    } else {
      final state = context.read<AuthCubit>().state;
      if (state is AuthSuccess && state.user.image != null && state.user.image!.isNotEmpty) {
        profileImage = NetworkImage(state.user.image!);
      } else {
        profileImage = const AssetImage(AppImages.my);
      }
    }

    return Column(
      children: [
        const SizedBox(height: 15),
        Center(
          child: Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(70),
              border: Border.all(width: 4, color: Colors.black87),
              image: DecorationImage(image: profileImage, fit: BoxFit.cover),
            ),
          ),
        ),
        const SizedBox(height: 15),
        GestureDetector(
          onTap: onPickImage,
          child: Container(
            alignment: Alignment.center,
            width: 120,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              "Upload Image",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
                fontSize: 15,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
