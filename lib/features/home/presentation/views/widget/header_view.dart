import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/features/home/presentation/views/widget/search.dart';

import '../../../../auth/manager/auth_cubit.dart';
import '../../../../auth/manager/auth_state.dart';
import 'header_row.dart';
import 'header_shimmer.dart';

class HeaderView  extends StatelessWidget {
  const HeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      scrolledUnderElevation: 0,
      elevation: 0,
      pinned: true,
      backgroundColor: Colors.white,
      toolbarHeight: 180.h,
      automaticallyImplyLeading: false,
      flexibleSpace: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
        child: Column(
          children: [
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                if (state is AuthLoading) {
                  return const HeaderShimmer();
                }
                if (state is AuthSuccess) {
                  return Header(userModel: state.user);
                }
                if (state is AuthError) {
                  return Text(state.errorMessage);
                }
                return const SizedBox.shrink();
              },
            ),
            Gap(12.h),
            Search(),
          ],
        ),
      ),
    );
  }
}
