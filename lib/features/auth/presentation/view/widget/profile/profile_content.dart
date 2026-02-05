import 'package:flutter/material.dart';
import 'package:hungry/features/auth/presentation/view/widget/profile/profileInfo_card.dart';
import 'package:hungry/features/auth/presentation/view/widget/profile/profile_image_picker.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../manager/auth_cubit.dart';


class ProfileContent extends StatelessWidget {
  final AuthCubit authCubit;
  final String? selectedImage;
  final Function(String) onPickImage;

  const ProfileContent({
    super.key,
    required this.authCubit,
    required this.selectedImage,
    required this.onPickImage,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
         const  SizedBox(height: 130),
          ProfileImagePicker(
            imagePath: selectedImage,
            onPickImage: () async {
              final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
              if (picked != null) onPickImage(picked.path);
            },
          ),
          const SizedBox(height: 20),
          const ProfileInfoCard(),
          const SizedBox(height: 20),
          const PaymentCard(),
          const SizedBox(height: 120),
        ],
      ),
    );
  }
}
