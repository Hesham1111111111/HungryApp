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
    ImageProvider image;

    final state = context.read<AuthCubit>().state;
    if (imagePath != null) {
      image = FileImage(File(imagePath!));
    } else if (state is AuthSuccess && state.user.image?.isNotEmpty == true) {
      image = NetworkImage(state.user.image!);
    } else {
      image = const AssetImage(AppImages.my);
    }

    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 65,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 60,
            backgroundImage: image,
          ),
        ),
        InkWell(
          onTap: onPickImage,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.camera_alt,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}
