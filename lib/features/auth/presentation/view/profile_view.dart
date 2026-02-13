import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/features/auth/presentation/view/widget/profile/profile_body.dart';
import 'package:hungry/features/auth/presentation/view/widget/profile/custom_profile_skeleton.dart';
import 'package:hungry/features/auth/presentation/view/widget/profile/profile_actions.dart';
import '../../manager/auth_cubit.dart';
import '../../manager/auth_state.dart';
import 'login_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String? selectedImage;

  @override
  void initState() {
    super.initState();
    context.read<AuthCubit>().getProfileData();
  }

  void _pickImage(String path) {
    setState(() {
      selectedImage = path;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();

    return Scaffold(
      backgroundColor: const Color(0xffF6F7FB),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
          } else if (state is AuthSuccess) {
            selectedImage = null;
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) return const CustomSkeleton();

          return ProfileBody(
            authCubit: authCubit,
            selectedImage: selectedImage,
            onPickImage: _pickImage,
          );
        },
      ),
      bottomNavigationBar: ProfileActions(
        onEdit: () => authCubit.updateProfile(selectedImage),
        
        onLogout: () async {
          await authCubit.logOut();
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const LoginView()),
            (_) => false,
          );
        },
      ),
    );
  }
}
