import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:hungry/core/resources/app_colors.dart';
import 'package:hungry/core/resources/images.dart';
import 'package:hungry/feachers/auth/manager/auth_cubit.dart';
import 'package:hungry/feachers/auth/manager/auth_state.dart';
import 'package:hungry/feachers/auth/presentation/view/widget/profile/custom_profile_filed.dart';
import 'package:hungry/feachers/auth/presentation/view/widget/profile/custom_profile_skeleton.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/widget/custom_text.dart';
import '../../../checkout/presentaion/views/widget/payment_method_tile.dart';
import 'login_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String? selectedImage;

  Future<void> pickImage() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedImage != null) {
      setState(() {
        selectedImage = pickedImage.path;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<AuthCubit>().getProfileData();
  }

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();

    return RefreshIndicator(
      onRefresh: () async {
        await authCubit.getProfileData();
      },
      child: Scaffold(
        backgroundColor: AppColors.primary,
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back, color: Colors.white),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Image.asset(AppImages.Vector),
            ),
          ],
        ),
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
            }

            if (state is AuthSuccess) {
              // بعد التحديث نرجّع الصورة null
              selectedImage = null;
            }
          },
          builder: (context, state) {
            if (state is AuthLoading && authCubit.nameController.text.isEmpty) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: CustomSkeleton(),
              );
            }

            ImageProvider profileImage;

            if (selectedImage != null) {
              profileImage = FileImage(File(selectedImage!));
            } else if (state is AuthSuccess &&
                state.user.image != null &&
                state.user.image!.isNotEmpty) {
              profileImage = NetworkImage(state.user.image!);
            } else {
              profileImage = const AssetImage(AppImages.my);
            }

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    const Gap(15),
                    Center(
                      child: Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(70),
                          border: Border.all(width: 4, color: Colors.black87),
                          image: DecorationImage(
                            image: profileImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const Gap(15),
                    GestureDetector(
                      onTap: pickImage,
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
                    const Gap(20),
                    CustomProfileText(
                      label: 'Name',
                      controller: authCubit.nameController,
                    ),
                    const Gap(25),
                    CustomProfileText(
                      label: 'Email',
                      controller: authCubit.emailController,
                    ),
                    const Gap(25),
                    CustomProfileText(
                      label: 'Delivery Address',
                      controller: authCubit.addressController,
                    ),
                    const Gap(25),
                    Divider(color: Colors.grey[400]),
                    const Gap(25),
                    PaymentMethodTile(
                      image: AppImages.visaProfile,
                      text: 'Debit card',
                      value: 'Visa',
                      groupValue: "",
                      colors: const Color(0xffF3F4F6),
                      textColor: Colors.black,
                      subtitle: '3566 **** **** 0505',
                      onChanged: (_) {},
                    ),
                    const Gap(90),
                  ],
                ),
              ),
            );
          },
        ),
        bottomSheet: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            height: 70,
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      context.read<AuthCubit>().updateProfile(selectedImage);
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: CustomText(
                          text: 'Edit Profile',
                          weight: FontWeight.w600,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ),
                  ),
                ),
                const Gap(10),
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      await context.read<AuthCubit>().logOut();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => LoginView()),
                      );
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: AppColors.primary),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: CustomText(
                          text: 'Logout',
                          weight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
